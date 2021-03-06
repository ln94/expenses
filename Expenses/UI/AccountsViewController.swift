//
//  AccountsViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 7/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit
import CoreData

class AccountsViewController: ScrollViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: TableView<StaticTableViewCell> = TableView<StaticTableViewCell>()
    
    var accounts: NSFetchedResultsController<Account> = Account.fetchResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Accounts"
        
        // FRC
        
        do {
            try accounts.performFetch()
        } catch {
            print("Can't perform fetch", error)
        }
        
        // Table
        
        tableView.fillSuperview(view)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: StaticTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? StaticTableViewCell {
            let account = accounts.object(at: indexPath)
            cell.leftLabel.text = account.name
            
            if account.balance >= 0 {
                cell.rightLabel.textColor = UIColor.mainText
                cell.rightLabel.text = "$" + account.balance.string
            }
            else {
                cell.rightLabel.textColor = UIColor.error
                cell.rightLabel.text = "-$" + (-account.balance).string
            }
        }
        
        return cell
    }
    
}
