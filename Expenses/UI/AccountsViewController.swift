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
    
    let tableView: UITableView = UITableView()
    
    let accounts: NSFetchedResultsController<Account>
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        // FRC
        let fetchRequest: NSFetchRequest = NSFetchRequest<Account>(entityName: "Account")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        accounts = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Context, sectionNameKeyPath: nil, cacheName: nil)

        do {
            try accounts.performFetch()
        } catch {
            print("Can't perform accounts fetch", error)
        }

        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Accounts"
        
        tableView.fillSuperview(view)
        tableView.register(AccountsViewCell.self, forCellReuseIdentifier: AccountsViewCell.identifier)
        tableView.rowHeight = AccountsViewCell.defaultHeight
        tableView.allowsSelection = false
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = UIColor.line
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: AccountsViewCell.identifier, for: indexPath)
        if let cell = cell as? AccountsViewCell {
            cell.setAccount(accounts.object(at: indexPath))
        }
        
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
