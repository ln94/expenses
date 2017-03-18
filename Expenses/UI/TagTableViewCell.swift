//
//  TagTableViewCell.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class TagTableViewCell: EditableTableViewCell {
    
    override class var defaultHeight: CGFloat {
        return 50
    }
    
    let label: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Text field
        
        textField.height = 50
        
        // Label
        
        label.addToSuperview(contentView, nextToView: textField, edge: .bottom, length: 30)
        label.textColor = UIColor.subtitle
        label.font = UIFont.subtitle
        label.textAlignment = .left
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
