//
//  DetailTableViewController.swift
//  Task
//
//  Created by Gibson Smiley on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        if let task = task {
            updateWithTask(task)
        }
        
        dueDateTextField.inputView = dueDatePicker
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var dueDateValue: NSDate?
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        dueDateTextField.text = sender.date.stringValue()
        dueDateValue = sender.date
    }

    
    func updateWithTask(task: Task) {
        titleTextField.text = task.title
        dueDateTextField.text = task.dueDate?.stringValue()
    }
    

//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
}
