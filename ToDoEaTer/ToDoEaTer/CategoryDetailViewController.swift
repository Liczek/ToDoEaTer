//
//  CategoryDetailViewController.swift
//  ToDoEaTer
//
//  Created by Paweł Liczmański on 11.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit
import CoreData

protocol CategoryDetailViewControllerDelegate: class{
    func categoryDetailViewControllerDidCancel(_ controller: CategoryDetailViewController)
    func categoryDetailViewController(_ controller: CategoryDetailViewController, didFinishAdding categoryName: String)
}


class CategoryDetailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var window: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: CategoryDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewConfiguration()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - Actions
    
    @IBAction func cancel() {
        delegate?.categoryDetailViewControllerDidCancel(self)
    }
    
    @IBAction func doneTaped() {
        if textField.text != nil {
            let categoryName = textField.text!
            delegate?.categoryDetailViewController(self, didFinishAdding: categoryName)
        }
        
        
    }
    
    @IBAction func cancelBTNTaped(_ sender: UIButton) {
        delegate?.categoryDetailViewControllerDidCancel(self)
    }
    @IBAction func addBTNTapped(_ sender: UIButton) {
        if textField.text != nil {
            let categoryName = textField.text!
            delegate?.categoryDetailViewController(self, didFinishAdding: categoryName)
        }
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
