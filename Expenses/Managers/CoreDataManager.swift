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
        
        let object: Account = Account(context: Context)
        object.id = id
        object.name = name
        object.initialBalance = Int64(balance * 100)
        object.balance = object.initialBalance
    }
    
    func createCategory(name: String) {
        var id : Int64
        if let last: Category = Category.all(orderBy: "id", ascending: true, context: Context).last {
            id = last.id + 1
        }
        else {
            id = 0
        }
        
        let object: Category = Category(context: Context)
        object.id = id
        object.name = name
        
        AppDelegate.shared.saveContext()
    }
    
    func createTag(name: String) {
        var id : Int64
        if let last: Tag = Tag.all(orderBy: "id", ascending: true, context: Context).last {
            id = last.id + 1
        }
        else {
            id = 0
        }
        
        let object: Tag = Tag(context: Context)
        object.id = id
        object.name = name
        
        AppDelegate.shared.saveContext()
    }
}
