//
//  AddAccountViewController.swift
//  Expenses
//
//  Created by Lana on 13/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class AddAccountViewController: NavigationViewController, UITextFieldDelegate {
    
    let nameLabel: UILabel = UILabel()
    let nameField: UITextField = UITextField()
    let balanceLabel: UILabel = UILabel()
    let balanceField: UITextField = UITextField()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add account"
        navigationType = .back
        
        // Account name
    
        nameLabel.addToSuperview(view, nextToView: topBar, edge: .bottom, length: 20, insets: CGPoint(x: Padding.medium, y: Padding.large))
        nameLabel.textAlignment = .left
        nameLabel.attributedText = "Account Name".subtitleString()

        nameField.addToSuperview(view, nextToView: nameLabel, edge: .bottom, length: 24, insets: CGPoint(x: 0, y: Padding.small))
        nameField.textColor = UIColor.mainText
        nameField.tintColor = UIColor.mainText
        nameField.font = UIFont.mainText
        nameField.placeholder = "Name"
        nameField.returnKeyType = .next
        nameField.autocorrectionType = .no
        nameField.autocapitalizationType = .words
        nameField.delegate = self
        
        let nameSeparator: UIView = UIView()
        nameSeparator.addToSuperview(view, nextToView: nameField, edge: .bottom, length: 1, insets: CGPoint(x: 0, y: Padding.medium))
        nameSeparator.backgroundColor = UIColor.line

        // Account balance
        
        balanceLabel.addToSuperview(view, nextToView: nameSeparator, edge: .bottom, length: 20, insets: CGPoint(x: 0, y: Padding.large))
        balanceLabel.textAlignment = .left
        balanceLabel.attributedText = "Account Balance".subtitleString()
        
        balanceField.addToSuperview(view, nextToView: balanceLabel, edge: .bottom, length: 24, insets: CGPoint(x: 0, y: Padding.small))
        balanceField.textColor = UIColor.mainText
        balanceField.tintColor = UIColor.mainText
        balanceField.font = UIFont.mainText
        balanceField.placeholder = "$0.00"
        balanceField.keyboardType = .decimalPad
        balanceField.delegate = self
        
        let balanceSeparator: UIView = UIView()
        balanceSeparator.addToSuperview(view, nextToView: balanceField, edge: .bottom, length: 1, insets: CGPoint(x: 0, y: Padding.medium))
        balanceSeparator.backgroundColor = UIColor.line
        
        // Save button
        
        let saveButton: UIButton = UIButton()
        saveButton.addToSuperview(view, nextToView: balanceSeparator, edge: .bottom, size: ActionButtonSize, inset: Padding.medium)
        saveButton.setAttributedTitle("Save".titleString(), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        
        // GR
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Buttons
    
    func saveButtonPressed() {
        if let name = nameField.text, nameField.text != "" {
            view.endEditing(true)
            
            // Get balance
            if let balanceText: String = balanceField.text, balanceField.text != "" {
                if let balance: Double = Double(balanceText.replacingOccurrences(of: "$", with: "")) {
                    DataManager.createAccount(name: name, balance: balance)
                    dismiss(animated: true, completion: nil)
                }
                else {
                    // Show balance error (shouldn't happen)
                    balanceLabel.textColor = UIColor.error
                    
                    balanceField.shake()
                    balanceField.becomeFirstResponder()
                }
            }
            else {
                DataManager.createAccount(name: name, balance: 0)
                dismiss(animated: true, completion: nil)
            }
        }
        else {
            // Show name error
            nameLabel.textColor = UIColor.error
            
            nameField.shake()
            nameField.becomeFirstResponder()
        }
    }
    
    // MARK: - Actions
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text: String = textField.text ?? ""
        
        if textField == nameField {
            
            // Trim spaces in the beginning
            if text == "" && string == " " {
                return false
            }
            
            // Return to subtitle color
            if string != "" {
                nameLabel.textColor = UIColor.subtitle
            }
            
            // Limit to 30 characters
            return text.replacingCharacters(in: range, with: string).characters.count <= 30
        }
        else {
            // Keep $
            if text.replacingCharacters(in: range, with: string) == "" {
                return false
            }
            // Don't allow just .
            if textField.text == "$" && string == "." {
                textField.text = "$0."
                return false
            }
            // Don't allow 01...
            if textField.text == "$0" && string != "." && string != "" {
                textField.text = "$" + string
                return false
            }
            // Only one .
            if text.characters.last == "." && string == "." {
                return false
            }
            
            // Limit to 10 character before . and 2 after
            let newText = text.replacingCharacters(in: range, with: string)
            if let index : String.Index = newText.range(of: ".")?.upperBound {
                return newText.distance(from: index, to: newText.endIndex) <= 2 && newText.characters.count <= 12
            }
            else {
                return newText.characters.count <= 10
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == balanceField && textField.text == "" {
            textField.text = "$"
        }
    
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == nameField {
            // Trim spaces in the end
            textField.text = textField.text?.trimmingCharacters(in: .whitespaces)
        }
        else {
            if textField.text == "$" {
                textField.text = nil
            }
            else if textField.text?.characters.last == "." {
                textField.text?.remove(at: (textField.text?.endIndex)!)
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            balanceField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}
