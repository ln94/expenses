//
//  ExpenseFieldCell.swift
//  Expenses
//
//  Created by Lana Shatonova on 16/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class ExpenseFieldCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = 70
    static let identifier: String = "ExpenseFieldCell"
    
    private let titleLabel: UILabel = UILabel()
    private let valueLabel: UILabel = UILabel()
    
    private var _field: ExpenseField = .error
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.addToSuperview(contentView, edge: .top, length: 20, insets: UIEdgeInsets(x: Padding.medium))
        titleLabel.textAlignment = .left
        
    }
    
    var field: ExpenseField {
        get {
            return _field
        }
        set {
            _field = newValue
            
            titleLabel.attributedText = newValue.title().subtitleString()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
