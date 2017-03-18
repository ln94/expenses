//
//  CoreDataManager.swift
//  Expenses
//
//  Created by Lana on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    func createAccount(name: String, balance: Double = 0) {
        
        var id : Int64
        if let last: Account = Account.all(orderBy: "id", ascending: true, context: Context).last {
            id = last.id + 1
        }
        else {
            id = 0
        }
        
        let account: Account = Account(context: Context)
        account.id = id
        account.name = name
        account.initialBalance = Int64(balance * 100)
        account.balance = account.initialBalance
    }
    
    func createCategory(name: String) {
        var id : Int64
        if let last: Category = Category.all(orderBy: "id", ascending: true, context: Context).last {
            id = last.id + 1
        }
        else {
            id = 0
        }
        
        let category: Category = Category(context: Context)
        category.id = id
        category.name = name
        
        AppDelegate.shared.saveContext()
    }
}
