//
//  TaskController.swift
//  Task
//
//  Created by Taylor Bills on 1/31/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: -  Properties
    static var shared = TaskController()
    var tasks: [Task] = []
    var mockTasks: [Task] {
        get {
            let task1 = Task(name: "task1")
            let task2 = Task(name: "task2", notes: "We need to do task 2", due: Date(), context: CoreDataStack.context)
            let task3 = Task(name: "task3", notes: "We finished this task", due: nil,context: CoreDataStack.context)
            task3.isComplete = true
            return [task1, task2, task3]
        }
    }
    
    init() {
        self.tasks = fetchTasks()
    }
    
    // MARK: -  CRUD
    
    // Add New Task
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    // Update Existing Task
    func updateTask(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    // Remove Task
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
    }
    
    // Save to persistence
    func saveToPersistentStore() {
        try? CoreDataStack.context.save()
    }
    
    // Fetch Request
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        //        return (try? CoreDataStack.context.fetch(request)) ?? []
        return mockTasks
    }
}
