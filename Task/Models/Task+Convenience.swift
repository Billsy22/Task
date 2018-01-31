//
//  Task+Convenience.swift
//  Task
//
//  Created by Taylor Bills on 1/31/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    // MARK: -  Initializer
    convenience init(name: String, notes: String? = nil, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
    }
}
