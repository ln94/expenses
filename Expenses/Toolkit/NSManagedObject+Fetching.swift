//
//  NSManagedObject+Fetching.swift
//  Expenses
//
//  Created by Lana on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import CoreData

public extension NSFetchRequestResult {
    
    static func all(predicate: NSPredicate = NSPredicate(value: true), context: NSManagedObjectContext) -> [Self] {
        let fetchRequest = NSFetchRequest<Self>(entityName: String(describing: self))
        fetchRequest.predicate = predicate
        fetchRequest.includesSubentities = false
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch (let error as NSError) {
            print("Error performing fetch request: " + error.localizedDescription)
            return []
        }
    }
    
    static func all(orderBy: String, ascending: Bool, predicate: NSPredicate = NSPredicate(value: true), context: NSManagedObjectContext) -> [Self] {
        let fetchRequest = NSFetchRequest<Self>(entityName: String(describing: self))
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: orderBy, ascending: ascending)]
        fetchRequest.includesSubentities = false
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch (let error as NSError) {
            print("Error performing fetch request: " + error.localizedDescription)
            return []
        }
    }

}


