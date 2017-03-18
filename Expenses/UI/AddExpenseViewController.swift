//
//  AddExpenseViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 16/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public enum ExpenseField: Int {
    
    case error = -1
    
    case type = 0
    case account
    case tag
    case date
    case note
    
    case count
    
    func title() -> String {
        switch self {
        case .type:
            return "Type"
        case .account:
            return "Account"
        case .tag:
            return "Tag"
        case .date:
            return "Date"
        case .note:
            return "Note"
        default:
            return ""
        }
    }
}

class AddExpenseViewController: NavigationViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let amountTextField: UITextField = UITextField()
    let tableView: TableView<StaticTableViewCell> = TableView<StaticTableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add expense"
        navigationType = .back
        
        // Amount
        
        amountTextField.addToSuperview(view, nextToView: topBar, edge: .top, length: 70, insets: CGPoint(x: Padding.small, y: 0))
        amountTextField.textColor = UIColor.mainText
        amountTextField.tintColor = UIColor.mainText
        amountTextField.font = UIFont.systemFont(ofSize: 24)
        amountTextField.textAlignment = .center
        amountTextField.placeholder = "-$0.00"
        amountTextField.returnKeyType = .next
        amountTextField.keyboardType = .decimalPad
        amountTextField.delegate = self
        
        let amountSeparator: UIView = UIView()
        amountSeparator.addToSuperview(view, nextToView: amountTextField, edge: .bottom, length: 1)
        amountSeparator.backgroundColor = UIColor.line
        
        // Fields table
        
        tableView.fillSuperview(view, insets: UIEdgeInsets(top: amountSeparator.bottom))
        tableView.register(ExpenseFieldCell.self, forCellReuseIdentifier: ExpenseFieldCell.identifier)
        tableView.rowHeight = ExpenseFieldCell.defaultHeight
        tableView.dataSource = self
        tableView.delegate = self

        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpenseField.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpenseFieldCell.identifier, for: indexPath)
        if let cell = cell as? ExpenseFieldCell {
            cell.field = ExpenseField(rawValue: indexPath.row) ?? .error
        }
        
        return cell
    }

}
