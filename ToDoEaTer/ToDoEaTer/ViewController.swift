//
//  ViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 10.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
//MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    
//MARK: - OBJECTS
    
    //tworzymy model tableView
    var categories: [NSManagedObject] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Task Categories"
        //rejestrujemy UITableViewCell class w table view
        //tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        //tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        
        
        
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Category", message: "Add a new name category", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .default) {
            action in
            if let textField = alert.textFields?.first {
                let categoryNameToSave = textField.text
                self.categories.append(categoryNameToSave!)
                self.tableView.reloadData()
            } else {
                return
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

            
            


//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category = categories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = category.value(forKeyPath: "name") as? String
        
        return cell
    }
    
    
}





















