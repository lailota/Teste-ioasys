//
//  LoginFormModelValidator.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 25/06/21.
//

import Foundation
import SystemConfiguration

struct LoginFormModelValidator {
    
    static func isEmailValid(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    static func IsPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < passwordMinLength || password.count > passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
}
