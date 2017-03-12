//
//  Goal+CoreDataProperties.swift
//  Expenses
//
//  Created by Lana on 12/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal");
    }

    @NSManaged public var total: Float
    @NSManaged public var type: Int16
    @NSManaged public var date: NSDate
    @NSManaged public var tag: Tag?
    @NSManaged public var category: Category?

}
