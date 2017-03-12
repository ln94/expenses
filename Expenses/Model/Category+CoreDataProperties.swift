//
//  Category+CoreDataProperties.swift
//  Expenses
//
//  Created by Lana on 12/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category");
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var color: NSObject?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for tags
extension Category {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}
