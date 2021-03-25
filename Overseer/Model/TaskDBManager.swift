//
//  TaskDBManager.swift
//  Overseer
//
//  Created by Joshua Fan on 12/9/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import Foundation
import SQLite

class TaskDBManager: DBManager {
    
    // Sets column names and data type
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    let duration = Expression<String>("duration")
    let deadline = Expression<String>("deadline")
    
    // Sets table name
    let tasks = Table("tasks")
    
    // For conversion
    let dateFormatter = DateFormatter()
    let dateComponentFormatter = DateComponentsFormatter()
    
    // Creates table
    func createTaskTable() {
        
        createDB()
        
        do {
            try db!.run(tasks.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name, unique: true)
                t.column(duration)
                t.column(deadline)
            })
        } catch {
            print("Failed to create Task table: \(error)")
        }
    }
    
    func addTask(_ taskName: String, _ timeRequired: TimeInterval, _ taskDeadline: Date) {
        
        // Convert TimeInterval to String
        let durationString = dateComponentFormatter.string(from: timeRequired)
        
        // Converts Date to String
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let deadlineString = dateFormatter.string(from: taskDeadline)
        
        do {
            try db!.run(tasks.insert(name <- taskName, duration <- durationString!, deadline <- deadlineString))
        } catch {
            print("Failed to add task: \(error)")
        }
        
        let scheduler = Scheduler()
        scheduler.add(name: taskName, lengthRequired: timeRequired)
    }
    
    func getTasks() -> [Task] {
        
        var taskList = [Task]()
        
        do {
            for task in try db!.prepare(tasks) {
                
                // Converts String to TimeInterval
                let durationTimeInterval = task[duration].convertToTimeInterval()
                
                // Converts String to Date
                let deadlineDate = dateFormatter.date(from: task[deadline])
                
                let task = Task.init(name: task[name], timeRequired: durationTimeInterval, deadline: deadlineDate!)
                
                taskList += [task]
            }
        } catch {
            print("Failed to get row: \(error)")
        }
        
        return taskList
    }
    
    func modifyTask(_ idForTask: Int64, _ newName: String) {
        
        let taskToBeModified = tasks.filter(id == idForTask)
        
        do {
            try db!.run(taskToBeModified.update(name <- newName))
        } catch {
            print("Failed to modify task: \(error)")
        }
        
    }
    
    func deleteTask(_ idForTask: Int64) {
        
        // Filters rows
        let taskToBeDeleted = tasks.filter(id == idForTask)
        
        do {
            try db!.run(taskToBeDeleted.delete())
        } catch {
            print("Failed to delete task: \(error)")
        }
        
    }
    
    // Will be used in settings for reset
    func deleteAllTasks() {
        
        do {
            try db!.run(tasks.delete())
        } catch {
            print("Failed to clear tasks: \(error)")
        }
    }
}
