//
//  Goal+CoreDataProperties.swift
//  Expenses
//
//  Created by Lana on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var total: Int16
    @NSManaged public var type: Int16
    @NSManaged public var category: Category?
    @NSManaged public var tag: Tag?

}
