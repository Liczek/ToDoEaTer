//
//  ViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 10.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit
import CoreData

class CategoriesViewController: UIViewController, CategoryDetailViewControllerDelegate, UINavigationControllerDelegate {
    
    
//MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    
//MARK: - OBJECTS
    
    //tworzymy model tableView
    var categories: [NSManagedObject] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        //rejestrujemy UITableViewCell class w table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        
        fetchData()
        
    }
    
    
//MARK: - SAVE
    
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
    
    
//MARK: - FETCH
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        categories.remove(at: indexPath.row)
//        let indexPaths = [indexPath]
//        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let categoryToDelete = categories[indexPath.row]
   // usuwanie
        if editingStyle == .delete {
            managedContext.delete(categoryToDelete)
   // zapisanie po usunięciu
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Error while deleting categry: \(error.userInfo)")
            }
        }
   // reload table view
        let fetchRequest:NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Error while fetching data from DB: \(error.userInfo)")
        }
        
        tableView.reloadData()
        
    }
    
    
    
    
    
//MARK: - PREPARE FOR SEGUE
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoryDetail" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! CategoryDetailViewController
            controller.delegate = self
        } else if segue.identifier == "TasksList" {
            let controller = segue.destination as! TasksListTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let category = categories[indexPath.row]
                controller.category = category.value(forKeyPath: "name") as! String
            }
        }
    }
    
    
    func categoryDetailViewControllerDidCancel(_ controller: CategoryDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func categoryDetailViewController(_ controller: CategoryDetailViewController, didFinishAdding categoryName: String) {
        save(name: categoryName)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}

            
            


//MARK: - UITableViewDataSource

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category = categories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = category.value(forKeyPath: "name") as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        performSegue(withIdentifier: "TasksList", sender: category)
    }
    
    
}






















