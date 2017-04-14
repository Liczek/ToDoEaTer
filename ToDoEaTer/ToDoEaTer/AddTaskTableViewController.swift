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
    
    
    var clearCell: ClearCell!
    var labelCell: LabelCell!
    var textFieldCell: TextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.registerNib(UINib(nibName: "CustomOneCell", bundle: nil), forCellReuseIdentifier: "CustomCellOne")
        self.tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        self.tableView.register(UINib(nibName: "ClearCell", bundle: nil), forCellReuseIdentifier: "ClearCell")
        self.tableView.register(UINib(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "LabelCell")
     

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
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 && indexPath.row == 0 {
        var textFieldCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            textFieldCell.nameTextField.placeholder = "test"
            
            cell = textFieldCell
        
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            var clearCell = tableView.dequeueReusableCell(withIdentifier: "ClearCell", for: indexPath) as! ClearCell
            cell = clearCell
        }
        
        if indexPath.section == 0 && indexPath.row == 2 {
            var labelCell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
            cell = labelCell
        }
        
        
        
        return cell
    }
    
    
    
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        print("xxx")
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
