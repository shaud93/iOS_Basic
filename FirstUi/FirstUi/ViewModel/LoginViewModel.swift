//
//  LoginViewModel.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/9/23.
//

import Foundation

class LoginViewModel {
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

}
