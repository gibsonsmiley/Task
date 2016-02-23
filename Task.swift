//
//  Task.swift
//  Task
//
//  Created by Gibson Smiley on 2/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {

    convenience init(title: String, note: String, dueDate: NSDate, isComplete: NSNumber, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.title = title
        self.note = note
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
