//
//  LabelCell.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell, TextFieldCellDelegate {
    
    
    @IBOutlet weak var taskLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        taskLabel.text = "no data"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func textFieldCellDelegate(_ controller: TextFieldCell, didSetNewTaskName newTaskName: String) {
        taskLabel.text = newTaskName
    }
    
}
