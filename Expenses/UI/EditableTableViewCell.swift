//
//  EditableTableViewCell.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit


class EditableTableViewCell : TableViewCell {
    
    let textField: UITextField = UITextField()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Text field
        
        textField.fillSuperview(contentView, insets: UIEdgeInsets(left: Padding.small, right: littleButtonSize.width))
        textField.textColor = UIColor.mainText
        textField.font = UIFont.mainText
        textField.textAlignment = .left
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.isUserInteractionEnabled = false
    }
    
    var isEditingTextField: Bool {
        get {
            return textField.isFirstResponder
        }
        set {
            backgroundColor = newValue ? UIColor.selection : UIColor.clear
            
            if newValue {
                textField.isUserInteractionEnabled = true
                textField.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
                textField.isUserInteractionEnabled = false
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
