//
//  SettingsViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 18/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public enum Setting: Int {
    case error = -1
    
    case tag = 0
    case category
    
    case count
    
    func title() -> String {
        switch self {
        case .tag:
            return "Tags"
        case .category:
            return "Categories"
        default:
            return ""
        }
    }
}

class SettingsViewController: NavigationViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: TableView<StaticTableViewCell> = TableView<StaticTableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        navigationType = .back
        
        tableView.fillSuperview(view, insets: UIEdgeInsets(top: topBar.bottom))
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: StaticTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? StaticTableViewCell {
            cell.leftLabel.text = (Setting(rawValue: indexPath.row) ?? .error).title()
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case Setting.tag.rawValue:
            present(TagsViewController(), animated: true, completion: {
                self.tableView.deselectRow(at: indexPath, animated: false)
            })
            break
            
        case Setting.category.rawValue:
            present(CategoriesViewController(), animated: true, completion: {
                self.tableView.deselectRow(at: indexPath, animated: false)
            })
            break
            
        default:
            break
        }
    }
}





