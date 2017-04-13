//
//  TasksListTableViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 12.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class TasksListTableViewController: UITableViewController, TextFieldCellDelegate {
    
    var category = String()
    
    var tasks: [NSManagedObject] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = category
        
        fetchData()
        tableView.reloadData()
    }
    
    
    func textFieldCellDelegate(_ controller: TextFieldCell, didSetNewTask newTaskName: String) {
        save(taskName: newTaskName)
        print("\(newTaskName) saved")
    }
    
    
//MARK: - SAVE
    
    func save(taskName: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)!
        
        let task = NSManagedObject(entity: entity, insertInto: managedContext)
        
        task.setValue(taskName, forKey: "taskName")
        
        do {
            try managedContext.save()
            tasks.append(task)
        } catch let error as NSError {           
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
    }
    
//MARK: - FETCH
    
    func fetchData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manegedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try manegedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch.\(error), \(error.userInfo)")
            
        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
//        var numberOfRowsInSection = 0
//        
//        if section == 0 {
//            numberOfRowsInSection = 2
//        }
//        if section == 1 {
//            numberOfRowsInSection = 3
//        }
//        return numberOfRowsInSection
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksListCell", for: indexPath)
        
        //cell.textLabel!.text = task.value(forKeyPath: "taskName") as? String
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
