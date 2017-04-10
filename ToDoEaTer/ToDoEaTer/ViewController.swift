//
//  ViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 10.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    
//MARK: - OBJECTS
    
    //tworzymy model tableView
    var categories: [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Task Categories"
        //rejestrujemy UITableViewCell class w table view
        //tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        //tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        
        
        
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
    }
    

}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
    
    
}





















