//
//  Tag+CoreDataClass.swift
//  Expenses
//
//  Created by Lana on 12/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import CoreData

@objc(Tag)
public class Tag: NSManagedObject {

    @nonobjc public class func fetchResultsController() -> NSFetchedResultsController<Tag> {
        
        let fetchRequest: NSFetchRequest = self.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
}
