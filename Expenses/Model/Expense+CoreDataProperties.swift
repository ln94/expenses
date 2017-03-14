//
//  Expense+CoreDataProperties.swift
//  Expenses
//
//  Created by Lana on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense");
    }

    @NSManaged public var amount: Int16
    @NSManaged public var date: NSDate?
    @NSManaged public var id: Int64
    @NSManaged public var note: String?
    @NSManaged public var type: Int16
    @NSManaged public var accountFrom: Account?
    @NSManaged public var accountTo: Account?
    @NSManaged public var tag: Tag?

}
