//
//  CoreData.swift
//  Task
//
//  Created by Taylor Bills on 1/31/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}

