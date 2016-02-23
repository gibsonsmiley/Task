//
//  Task+CoreDataProperties.swift
//  Task
//
//  Created by Gibson Smiley on 2/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var title: String
    @NSManaged var note: String?
    @NSManaged var dueDate: NSDate?
    @NSManaged var isComplete: NSNumber

}
