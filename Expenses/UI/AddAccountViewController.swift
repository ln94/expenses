//
//  AddAccountViewController.swift
//  Expenses
//
//  Created by Lana on 13/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class AddAccountViewController: NavigationViewController, UITextFieldDelegate {

    let nameField: UITextField = UITextField()
    let balanceField: UITextField = UITextField()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add account"
        
        navigationType = .back
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        // Account name
        
        let nameLabel: UILabel = UILabel()
        nameLabel.addToSuperview(view, nextToView: separator, edge: .bottom, length: 20, insets: CGPoint(x: Padding.medium, y: Padding.large))
        nameLabel.textColor = UIColor.subtitle
        nameLabel.font = UIFont.subtitle
        nameLabel.textAlignment = .left
        nameLabel.attributedText = NSAttributedString(string: "Account Name", attributes: [NSKernAttributeName: 2])

        nameField.addToSuperview(view, nextToView: nameLabel, edge: .bottom, length: 24, insets: CGPoint(x: 0, y: Padding.small))
        nameField.textColor = UIColor.mainText
        nameField.tintColor = UIColor.mainText
        nameField.font = UIFont.mainText
        nameField.placeholder = "Name"
        nameField.returnKeyType = .next
        nameField.delegate = self
        
        let nameSeparator: UIView = UIView()
        nameSeparator.addToSuperview(view, nextToView: nameField, edge: .bottom, length: 1, insets: CGPoint(x: 0, y: Padding.medium))
        nameSeparator.backgroundColor = UIColor.line

        // Account balance
        
        let balanceLabel: UILabel = UILabel()
        balanceLabel.addToSuperview(view, nextToView: nameSeparator, edge: .bottom, length: 20, insets: CGPoint(x: 0, y: Padding.large))
        balanceLabel.textColor = UIColor.subtitle
        balanceLabel.font = UIFont.subtitle
        balanceLabel.textAlignment = .left
        balanceLabel.attributedText = NSAttributedString(string: "Account Balance", attributes: [NSKernAttributeName : 2])
        
        balanceField.addToSuperview(view, nextToView: balanceLabel, edge: .bottom, length: 24, insets: CGPoint(x: 0, y: Padding.small))
        balanceField.textColor = UIColor.mainText
        balanceField.tintColor = UIColor.mainText
        balanceField.font = UIFont.mainText
        balanceField.placeholder = "0.00"
        balanceField.keyboardType = .decimalPad
        balanceField.delegate = self
        
        let balanceSeparator: UIView = UIView()
        balanceSeparator.addToSuperview(view, nextToView: balanceField, edge: .bottom, length: 1, insets: CGPoint(x: 0, y: Padding.medium))
        balanceSeparator.backgroundColor = UIColor.line
        
        // Save button
        
        let saveButton: UIButton = UIButton()
        saveButton.addToSuperview(view, nextToView: balanceSeparator, edge: .bottom, size: ButtonSize, inset: Padding.medium)
        saveButton.setAttributedTitle(NSAttributedString(string: "SAVE", attributes: [NSForegroundColorAttributeName: UIColor.mainText, NSFontAttributeName: UIFont.title, NSKernAttributeName : 2]), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonPressed() {
        if let name: String = nameField.text {
            Manager.createAccount(name: name, balance: 0)
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = (textField.text ?? "") as NSString
        let newText: String = oldText.replacingCharacters(in: range, with: string)
        
        if textField == nameField {
            return newText.characters.count <= 30
        }
        else {
            // DEBUG: Add checks
            if let index : String.Index = newText.range(of: ".")?.upperBound {
                return newText.distance(from: index, to: newText.endIndex) <= 2
            }
            else {
                return true
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            balanceField.becomeFirstResponder()
        }
        
        return true
    }
}
