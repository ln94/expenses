//
//  AccountsViewCell.swift
//  Expenses
//
//  Created by Lana on 15/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class AccountsViewCell: UITableViewCell {

    static let defaultHeight: CGFloat = 50
    static let identifier: String = "AccountsViewCell"
    
    private let nameLabel: UILabel = UILabel()
    private let balanceLabel: UILabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.fillSuperview(contentView, insets: UIEdgeInsets(x: Padding.medium))
        nameLabel.textColor = UIColor.mainText
        nameLabel.font = UIFont.mainText
        nameLabel.textAlignment = .left
        
        balanceLabel.fillSuperview(contentView, insets: UIEdgeInsets(x: Padding.medium))
        balanceLabel.font = UIFont.mainText
        balanceLabel.textAlignment = .right
    }
    
    func setAccount(_ account: Account) {
        nameLabel.text = account.name
        
        if account.balance >= 0 {
            balanceLabel.textColor = UIColor.mainText
            balanceLabel.text = "$" + account.balance.string
        }
        else {
            balanceLabel.textColor = UIColor.error
            balanceLabel.text = "-$" + (-account.balance).string
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
