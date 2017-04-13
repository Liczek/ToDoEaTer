//
//  TextFieldCell.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 13.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bcgImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.backgroundColor = UIColor.white
        
        bcgImage.backgroundColor = UIColor.lightGray
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
