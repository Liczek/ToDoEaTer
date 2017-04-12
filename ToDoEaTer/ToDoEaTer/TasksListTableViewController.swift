//
//  TasksListTableViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 12.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit


class TasksListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tasks List"
    }
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRowsInSection = 0
        
        if section == 0 {
            numberOfRowsInSection = 2
        }
        if section == 1 {
            numberOfRowsInSection = 3
        }
        return numberOfRowsInSection
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksListCell", for: indexPath)
        
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
