//
//  TableView.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 3.0, *)
class TableView<CellClass : TableViewCell> : UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        register(CellClass.self, forCellReuseIdentifier: CellClass.identifier)
        rowHeight = TableViewCell.defaultHeight
        separatorInset = UIEdgeInsets.zero
        separatorColor = UIColor.line
        contentInset.bottom = Padding.large
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
