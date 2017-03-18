//
//  TableView.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 8.0, *)
class TableView<CellClass : TableViewCell> : UITableView{

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        register(CellClass.self, forCellReuseIdentifier: "Cell")
        rowHeight = CellClass.defaultHeight
        separatorInset = UIEdgeInsets.zero
        separatorColor = UIColor.line
        contentInset.bottom = Padding.large
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
