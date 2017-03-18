//
//  StaticTableViewCell.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class StaticTableViewCell: TableViewCell {
    
    let leftLabel: UILabel = UILabel()
    let rightLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Labels
        
        leftLabel.fillSuperview(contentView, insets: UIEdgeInsets(left: Padding.small, right: littleButtonSize.width))
        leftLabel.textColor = UIColor.mainText
        leftLabel.font = UIFont.mainText
        leftLabel.textAlignment = .left
        
        rightLabel.fillSuperview(contentView, insets: UIEdgeInsets(left: Padding.small, right: littleButtonSize.width))
        rightLabel.font = UIFont.mainText
        rightLabel.textAlignment = .right
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backgroundColor = selected ? UIColor.selection : UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
