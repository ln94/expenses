//
//  AddAccountViewController.swift
//  Expenses
//
//  Created by Lana on 13/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class AddAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        // Top bar
        
        let titleLabel:UILabel = UILabel(superview: view, edge: .top, length: 20.0, insets: UIEdgeInsets(top: StatusBarHeight + Padding.small, left: 0, bottom: 0, right: 0))
        titleLabel.textColor = UIColor.mainText
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        titleLabel.attributedText = NSAttributedString(string: "ADD ACCOUNT", attributes: [NSKernAttributeName : 2])
        
        let backButton: UIButton = UIButton(superview: view, corner: .topLeft, size: CGSize(width: 16.0, height: 16.0), offset: CGPoint(x: 15.0, y: 34.0))
        backButton.setImage(UIImage(named: Icon.back), for: .normal)
        backButton.tintColor = UIColor.mainText
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        let separator: UIView = UIView(superview: view, edge: .top, length: 1, insets: UIEdgeInsets(top: 65.0, left: 0, bottom: 0, right: 0))
        separator.backgroundColor = UIColor.line
        
        // Account name
        
        let nameLabel: UILabel = UILabel(superview: view, edge: .top, length: 16.0, insets: UIEdgeInsets(top: 97.0, left: Padding.medium, bottom: 0, right: 0))
        nameLabel.textColor = UIColor.subtitleText
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.textAlignment = .left
        nameLabel.attributedText = NSAttributedString(string: "Account Name", attributes: [NSKernAttributeName: 2])
        
        let nameField: UITextField = UITextField(superview: view, edge: .top, length: 24.0, insets: UIEdgeInsets(top: 117.0, left: Padding.medium, bottom: 0, right: Padding.medium))
        nameField.textColor = UIColor.mainText
        nameField.tintColor = UIColor.mainText
        nameField.font = UIFont.systemFont(ofSize: 16)
        nameField.placeholder = "Name"
        
        let nameSeparator: UIView = UIView(superview: view, edge: .top, length: 1, insets: UIEdgeInsets(top: 151.0, left: Padding.medium, bottom: 0, right: 0))
        nameSeparator.backgroundColor = UIColor.line
        
        // Account balance
        
        let balanceLabel: UILabel = UILabel(superview: view, edge: .top, length: 16.0, insets: UIEdgeInsets(top: 182.0, left: Padding.medium, bottom: 0, right: 0))
        balanceLabel.textColor = UIColor.subtitleText
        balanceLabel.font = UIFont.systemFont(ofSize: 13)
        balanceLabel.textAlignment = .left
        balanceLabel.attributedText = NSAttributedString(string: "Account Balance", attributes: [NSKernAttributeName : 2])
        
        let balanceField: UITextField = UITextField(superview: view, edge: .top, length: 24.0, insets: UIEdgeInsets(top: 202.0, left: Padding.medium, bottom: 0, right: Padding.medium))
        balanceField.textColor = UIColor.mainText
        balanceField.tintColor = UIColor.mainText
        balanceField.font = UIFont.systemFont(ofSize: 16)
        balanceField.placeholder = "Balance"
        
        let balanceSeparator: UIView = UIView(superview: view, edge: .top, length: 1, insets: UIEdgeInsets(top: 236.0, left: Padding.medium, bottom: 0, right: 0))
        balanceSeparator.backgroundColor = UIColor.line
        
        // Save button
        
        let saveButton: UIButton = UIButton(superview: view, edge: .top, size: CGSize(width: 100, height: 40), offset: CGPoint(x: 0, y: 257))
        saveButton.setAttributedTitle(NSAttributedString(string: "SAVE", attributes: [NSForegroundColorAttributeName: UIColor.mainText, NSFontAttributeName: UIFont.systemFont(ofSize: 17),NSKernAttributeName : 2]), for: .normal)
    }
    
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
