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
        
        fetchData()
        
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Category", message: "Add a new name category", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .default) {
            action in
            if let textField = alert.textFields?.first {
                let categoryNameToSave = textField.text
                
                
                self.save(name: categoryNameToSave!)
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
    
    
    
    func save(name: String) {
        //zamiast if let można użyć guard let
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Category", in: managedContext)!
        
        let category = NSManagedObject(entity: entity, insertInto: managedContext)
        
        category.setValue(name, forKeyPath: "name")
        
        
        do {
            try managedContext.save()
            categories.append(category)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Category")
        let fetchRequest:NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try managedContext.fetch(fetchRequest)
        } catch {
            let error = error as NSError
            print("Could not fetch. \(error), \(error.userInfo)")
        }
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





















