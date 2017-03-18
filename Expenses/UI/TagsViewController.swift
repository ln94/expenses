//
//  TagsViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit
import CoreData

class TagsViewController: NavigationViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView: TableView<StaticTableViewCell> = TableView<StaticTableViewCell>()
    
    var tags: NSFetchedResultsController<Tag> = Tag.fetchResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tags"
        navigationType = .both
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        // FRC 
        
        do {
            try tags.performFetch()
        } catch {
            print("Can't perform fetch", error)
        }
        
        // Table
        
        tableView.fillSuperview(view, insets: UIEdgeInsets(top: topBar.bottom))
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
    
    // MARK: - Buttons
    
    func addButtonPressed() {
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: StaticTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? StaticTableViewCell {
            let tag = tags.object(at: indexPath)
            cell.leftLabel.text = tag.name
            cell.forwardButton.alpha = 0
        }
        
        return cell
    }

}
