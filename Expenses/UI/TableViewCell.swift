//
//  TableViewCell.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    class var defaultHeight: CGFloat {
        return 50
    }
    
    static let identifier: String = "Cell"
    
    let forwardButton: UIButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        // Forward button
        
        forwardButton.addToSuperview(contentView, edge: .right, size: littleButtonSize)
        forwardButton.setImage(Icon.forward.image(), for: .normal)
        forwardButton.imageView?.tintColor = UIColor.topBarLine
        forwardButton.imageEdgeInsets = littleButtonInsets
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
