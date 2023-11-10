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
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if loginViewModel.LoginValidation(email: LogInTextField.text, password: PASSWORD.text){
            
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

