//
//  ViewController.swift
//  FirstUi
//
//  Created by D'Ante Watson on 10/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LogInTextField: UITextField!
    
    @IBOutlet weak var PASSWORD: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func LoginValidation(email: String?, password: String?) -> Bool {
        var isValid = false
        guard let email = email else {
            return isValid
        }
        
        guard let password = password else {
            return isValid
        }
        
        let isvalidPassword = password.count >= 6
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        isValid = isEmailValid && isvalidPassword
        
        return isValid
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if LoginValidation(email: LogInTextField.text, password: PASSWORD.text){
            
            if (segue.destination.title == "HomeViewController"){
                
                let desinatedViewController:HomeViewController = segue.destination as! HomeViewController
                
                desinatedViewController.homeLabelText = LogInTextField.text!
                print(segue.destination.title ?? "no")
                
            }
            
        }
        else {
            print("YOU ARE NOT AllOWED")
        }
    }
}

