//
//  TextFieldCell.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 13.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol TextFieldCellDelegate: class {
    func textFieldCellDelegate(_ cell: TextFieldCell, didSetNewTaskName newTaskName: String)}

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    
    
    weak var delegateTextFieldCell: TextFieldCellDelegate?
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bcgImage: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidEnd)
        
        
        
        nameTextField.backgroundColor = UIColor.white
        
        bcgImage.backgroundColor = UIColor.lightGray
        
        nameTextField.becomeFirstResponder()
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        let newTaskName = textField.text!
        print(newTaskName)
        delegateTextFieldCell?.textFieldCellDelegate(self, didSetNewTaskName: newTaskName)
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
}
