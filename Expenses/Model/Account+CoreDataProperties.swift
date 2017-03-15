//
//  Account+CoreDataProperties.swift
//  Expenses
//
//  Created by Lana on 15/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account");
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var balance: Int64
    @NSManaged public var initialBalance: Int64
    @NSManaged public var expenseFrom: NSSet?
    @NSManaged public var expenseTo: NSSet?

}

// MARK: Generated accessors for expenseFrom
extension Account {

    @objc(addExpenseFromObject:)
    @NSManaged public func addToExpenseFrom(_ value: Expense)

    @objc(removeExpenseFromObject:)
    @NSManaged public func removeFromExpenseFrom(_ value: Expense)

    @objc(addExpenseFrom:)
    @NSManaged public func addToExpenseFrom(_ values: NSSet)

    @objc(removeExpenseFrom:)
    @NSManaged public func removeFromExpenseFrom(_ values: NSSet)

}

// MARK: Generated accessors for expenseTo
extension Account {

    @objc(addExpenseToObject:)
    @NSManaged public func addToExpenseTo(_ value: Expense)

    @objc(removeExpenseToObject:)
    @NSManaged public func removeFromExpenseTo(_ value: Expense)

    @objc(addExpenseTo:)
    @NSManaged public func addToExpenseTo(_ values: NSSet)

    @objc(removeExpenseTo:)
    @NSManaged public func removeFromExpenseTo(_ values: NSSet)

}
