//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 7/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class ExpensesViewController: ScrollViewController {

    override var color : UIColor {
        return UIColor.green.withAlphaComponent(0.2)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Expenses"
    }

}
