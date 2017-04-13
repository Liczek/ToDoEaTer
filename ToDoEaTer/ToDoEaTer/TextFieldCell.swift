//
//  TextFieldCell.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 13.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol TextFieldCellDelegate: class {
    func textFieldCellDelegate(_ controller: TextFieldCell, didSetNewTask newTaskName: String)
}

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    
    
    weak var delegateTextFieldCell: TextFieldCellDelegate?
    
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bcgImage: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.backgroundColor = UIColor.white
        
        bcgImage.backgroundColor = UIColor.lightGray
        
        textField.becomeFirstResponder()
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func textFieldDidChange(_ textField: UITextField) {
        self.textField.delegate = self
        let newTaskName = textField.text!
        delegateTextFieldCell?.textFieldCellDelegate(self, didSetNewTask: newTaskName)
        
    }
    
    
}
