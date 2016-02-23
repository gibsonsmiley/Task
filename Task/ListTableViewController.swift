//
//  ListTableViewController.swift
//  Task
//
//  Created by Caleb Hicks on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        
        if let indexPath = tableView.indexPathForCell(sender) {
            let task = TaskController.sharedController.tasksArray[indexPath.row]
        }
        TaskController.sharedController.saveToPersistentStorage()
        tableView.reloadData()
    }
    
    //    MARK: - Table View
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
        let task = TaskController.sharedController.tasksArray[indexPath.row]
        
        cell.updateWithTask(task)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedController.tasksArray.count
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
//            TaskController.sharedController.tasksArray.removeTask([indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            TaskController.sharedController.saveToPersistentStorage()
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cellToDetailView" {
            let detailViewController = segue.destinationViewController as? DetailTableViewController
            
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                let task = TaskController.sharedController.tasksArray[indexPath.row]
                detailViewController?.task = task
            }
        } else if segue.identifier == "addToDetailView" {
        }
    }
}

