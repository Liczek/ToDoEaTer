//
//  CategoryDetailViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 11.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit


}

class CategoryDetailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var window: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewConfiguration()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTaped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBTNTaped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addBTNTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
//MARK: - Methods
    
    func viewConfiguration() {
        window.backgroundColor = UIColor.red
        
        window.clipsToBounds = true
        window.layer.cornerRadius = 20
        window.layer.borderWidth = 1
        //window.layer.borderColor
        
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        textField.borderStyle = .line
        textField.placeholder = "Enter name of new Category"
        textField.backgroundColor = UIColor.white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
