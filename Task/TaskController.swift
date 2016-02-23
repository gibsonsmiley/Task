//
//  TaskController.swift
//  Task
//
//  Created by Gibson Smiley on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    private let tasksKey = "tasks"
    
    static let sharedController = TaskController()
    
    var tasksArray: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        return (try? moc.executeFetchRequest(request) as! [Task]) ?? []
        
    }
    
    
    var completedTasks: [Task] {
        return tasksArray.filter() {$0.isComplete.boolValue}
    }
    
    var incompleteTasks: [Task] {
        return tasksArray.filter() {!$0.isComplete.boolValue}
    }
    
    func addTask(task: Task) {
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        task.managedObjectContext?.deleteObject(task)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        return (try? moc.save()) ?? print("Error")
//        do {
//            try moc.save()
//        } catch {
//            print("Error")
//        }
    }
    
//    func filePath(key: String) -> String {
//        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
//        let documentPath: AnyObject = directorySearchResults[0]
//        let tasksPath = documentPath.stringByAppendingString("/\(key).plist")
//        return tasksPath
//    }
}


