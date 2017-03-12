//
//  Tag+CoreDataProperties.swift
//  Expenses
//
//  Created by Lana on 12/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag");
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var expenses: NSSet?
    @NSManaged public var category: Category?

}

// MARK: Generated accessors for expenses
extension Tag {

    @objc(addExpensesObject:)
    @NSManaged public func addToExpenses(_ value: Expense)

    @objc(removeExpensesObject:)
    @NSManaged public func removeFromExpenses(_ value: Expense)

    @objc(addExpenses:)
    @NSManaged public func addToExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeFromExpenses(_ values: NSSet)

}
