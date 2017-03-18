//
//  Account+CoreDataClass.swift
//  Expenses
//
//  Created by Lana on 12/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData

@objc(Account)
public class Account: NSManagedObject {
    
    @nonobjc public class func fetchResultsController() -> NSFetchedResultsController<Account> {
        
        let fetchRequest: NSFetchRequest = self.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Context, sectionNameKeyPath: nil, cacheName: nil)
    }
}
