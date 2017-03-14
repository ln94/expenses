//
//  DataManager.swift
//  Expenses
//
//  Created by Lana on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    func createAccount(name: String, balance: Int16 = 0) {
        let account: Account = Account(context: Context)
        account.name = name
        account.initialBalance = balance
        
        if let last: Account = Account.all(orderBy: "id", ascending: true, context: Context).last {
            account.id = last.id + 1
        }
        else {
            account.id = 0
        }
    }
}
