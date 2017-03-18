//
//  TagsViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit
import CoreData

class TagsViewController: NavigationViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, UITextFieldDelegate {

    let tableView: TableView<TagTableViewCell> = TableView<TagTableViewCell>()
    var editingCell: TagTableViewCell?
    
    let viewToAdd: UIView = UIView()
    let textFieldToAdd: UITextField = UITextField()
    
    var tags: NSFetchedResultsController<Tag> = Tag.fetchResultsController()
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tags"
        navigationType = .both
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        // FRC 
        
        do {
            try tags.performFetch()
        } catch {
            print("Can't perform fetch", error)
        }
        tags.delegate = self
        
        // Table
        
        tableView.fillSuperview(view, insets: UIEdgeInsets(top: topBar.bottom))
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
        
        // Add category view
        
        viewToAdd.addToSuperview(view, nextToView: tableView, edge: .top, length: TableViewCell.self.defaultHeight)
        viewToAdd.backgroundColor = UIColor.selection
        viewToAdd.alpha = 0
        
        textFieldToAdd.fillSuperview(viewToAdd, insets: UIEdgeInsets(x: Padding.small))
        textFieldToAdd.textColor = UIColor.mainText
        textFieldToAdd.font = UIFont.mainText
        textFieldToAdd.returnKeyType = .done
        textFieldToAdd.delegate = self
        
        let separator: UIView = UIView()
        separator.addToSuperview(viewToAdd, edge: .bottom, length: 1)
        separator.backgroundColor = UIColor.line
        
        view.bringSubview(toFront: topBar)
        
        // GR
        tap.addTarget(self, action: #selector(didTap))
        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeUp))
        swipeUp.direction = .up
        viewToAdd.addGestureRecognizer(swipeUp)
        
        // Keyboard Observer
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Buttons
    
    func addButtonPressed() {
        
        if viewToAdd.alpha == 0 {
            
            // Finish editing cell
            if let cell = editingCell {
                cell.isEditingTextField = false
                editingCell = nil
            }
            
            showAddView(show: true)
        }
        else {
            showAddView(show: false)
        }
    }

    // MARK: - Actions
    
    func didTap() {
        if !textFieldToAdd.isEmpty {
            addCategory()
        }
    }
    
    func didSwipeUp() {
        showAddView(show: false)
    }
    
    func addCategory() {
        
        if let name = textFieldToAdd.text {
            view.endEditing(true)
            DataManager.createTag(name: name.trimmed())
        }
    }
    
    func showAddView(show: Bool, categoryAdded: Bool = false) {
        
        tableView.allowsSelection = !show
        
        showAddButtonIcon(show ? Icon.cancel : Icon.add)
        
        if show {
            view.addGestureRecognizer(tap)
            
            viewToAdd.alpha = 1
            UIView.animate(withDuration: 0.3, animations: {
                self.viewToAdd.top = self.tableView.top
                self.tableView.contentInset.top = self.viewToAdd.height
                if self.tableView.contentOffset.y == 0 {
                    self.tableView.contentOffset.y -= self.viewToAdd.height
                }
                self.textFieldToAdd.becomeFirstResponder()
                
            })
        }
        else {
            view.removeGestureRecognizer(tap)
            
            if categoryAdded {
                UIView.animate(withDuration: 0.2, animations: {
                    self.tableView.contentOffset.y = 0
                    
                }, completion: { (Bool) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.textFieldToAdd.resignFirstResponder()
                        self.viewToAdd.backgroundColor = UIColor.clear
                        
                    }, completion: { (_) in
                        self.textFieldToAdd.text = nil
                        self.viewToAdd.backgroundColor = UIColor.selection
                        self.viewToAdd.bottom = self.tableView.top
                        self.viewToAdd.alpha = 0
                    })
                })
            }
            else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.textFieldToAdd.resignFirstResponder()
                    self.viewToAdd.bottom = self.tableView.top
                    self.tableView.contentInset.top = 0
                    
                }, completion: { (_) in
                    self.textFieldToAdd.text = nil
                    self.viewToAdd.alpha = 0
                })
            }
        }
    }
    
    func showAddButtonIcon(_ icon: Icon) {
        
        addButton.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.5, delay: 0, options: .transitionCurlDown, animations: {
            self.addButton.setImage(icon.image(), for: .normal)
            
        }) { (Bool) in
            self.addButton.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: TagTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? TagTableViewCell {
            let tag = tags.object(at: indexPath)
            cell.textField.text = tag.name
            cell.label.text = "Category"
            cell.textField.delegate = self
        }
        
        return cell
    }

    // MARK: - UITableViewDelegate: Selecting
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = editingCell {
            
            // Stop editing cell and nullify it
            if cell.isEditingTextField {
                cell.isEditingTextField = false
            }
            else {
                editingCell = nil
            }
        }
        else if let cell: TagTableViewCell = tableView.cellForRow(at: indexPath) as? TagTableViewCell {
            // Start editing category name
            editingCell = cell
            cell.isEditingTextField = true
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        // Stop editing cell
        if let cell = editingCell {
            cell.isEditingTextField = false
        }
    }
    
    // MARK: - UITableViewDelegate: Swiping
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction: UITableViewRowAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action: UITableViewRowAction, indexPath: IndexPath) in
            Context.delete(self.tags.object(at: indexPath))
        }
        
        return [deleteAction]
    }

    // MARK: - NSFetchedResultsControllerDelegate
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .none)
                tableView.contentInset.top = 0
                showAddView(show: false, categoryAdded: true)
            }
            break
            
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .bottom)
            }
            break
            
        case .move:
            if let indexPath = indexPath, let newIndexPath = newIndexPath {
                tableView.moveRow(at: indexPath, to: newIndexPath)
            }
            break
            
        case .update:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            break
        }
    }

    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text: String = textField.text ?? ""
        
        // Trim spaces in the beginning
        if text == "" && string == " " {
            return false
        }
        
        // Limit to 30 characters
        return text.replacingCharacters(in: range, with: string).characters.count <= 30
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        // Save changes
        if textField != textFieldToAdd, let cell = editingCell {
            if cell.subviews.contains(textField), let indexPath = tableView.indexPath(for: cell) {
                let tag = tags.object(at: indexPath)
                
                if textField.isEmpty {
                    // Delete category
                    Context.delete(tag)
                }
                else if let name = textField.text {
                    // Update category name
                    tag.name = name.trimmed()
                }
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == textFieldToAdd {
            if textField.isEmpty {
                showAddView(show: false)
            }
            else {
                addCategory()
            }
        }
        else if let cell = editingCell {
            cell.isEditingTextField = false
            editingCell = nil
        }
        
        return true
    }
    
    // MARK: - Keyboard Observer
    
    func keyboardWillShow(notification: Notification) {
        
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height {
            tableView.contentInset.bottom += keyboardHeight
            print(keyboardHeight)
            
            // Check if editing cell is visible
            if let cell = editingCell {
                let cellY : CGFloat = cell.bottom - tableView.contentOffset.y + tableView.top
                
                if cellY > view.height - keyboardHeight {
                    // Scroll
                    UIView.animate(withDuration: 0.3, animations: {
                        self.tableView.contentOffset.y += cellY - self.view.height + keyboardHeight + Padding.small
                    })
                }
            }
        }
    }
    
    func keyboardWillHide(notification: Notification) {
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            tableView.contentInset.bottom -= keyboardHeight
            print(keyboardHeight)
        }
    }
}
