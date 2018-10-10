//
//  ContactVC.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 11/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import CoreData

class ContactVC: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var message: UITextField!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        email.delegate = self
        city.delegate = self
        phone.delegate = self
        message.delegate = self
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        clearTextFields()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        saveData()
        clearTextFields()
        
        let saveAlert = UIAlertController(title: "Save Successful", message: "Thank You for contacting us", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        saveAlert.addAction(saveAction)
        self.present(saveAlert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: RESETING TEXT FIELDS
    
    func clearTextFields() {
        
        name.text = ""
        email.text = ""
        phone.text = ""
        city.text = ""
        message.text = ""
        
    }
    
    
    // MARK: Core Data Save Method
    
    func saveData() {
        
        let context = appDel.persistentContainer.viewContext
        let contact = Contact(context: context)
        
        guard let name = name.text else {return}
        guard let email = email.text else {return}
        guard let phone = phone.text else {return}
        guard let city = city.text else {return}
        guard let message = message.text else {return}
        
        contact.name = name
        contact.email = email
        contact.phone = phone
        contact.city = city
        contact.message = message
        
        appDel.saveContext()
        
        
    }
    
    

}

extension ContactVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        name.resignFirstResponder()
        email.resignFirstResponder()
        phone.resignFirstResponder()
        city.resignFirstResponder()
        message.resignFirstResponder()
        
        return true
    }
    
}
