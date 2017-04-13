//
//  AddTaskTableViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 12.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class AddTaskTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.registerNib(UINib(nibName: "CustomOneCell", bundle: nil), forCellReuseIdentifier: "CustomCellOne")
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib(nibName: "ClearCell", bundle: nil), forCellReuseIdentifier: "ClearCell")
        
        

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header nr \(section)"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 && indexPath.row == 0 {
        cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath)
        
        
         
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ClearCell", for: indexPath)
            
        }
        
        
        
        return cell
    }
    
    
    
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        print("xxx")
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
