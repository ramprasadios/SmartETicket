//
//  ValidationManager.swift
//  SmartETicket
//
//  Created by Ramprasad A on 13/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation

class ValidationHandler {
    
    enum ValidationPage {
        case login
        case signup
    }
    
    enum ValidatingField: Int {
        case firstName = 101
        case lastName
        case emailField
        case genderField
        case dobField
        case phoneNumber
        case loginEmail
        case loginPassword
    }
    
    var validationPage: ValidationPage = .login
    var firstName: String?
    var lastName: String?
    var email: String?
    var gender: String?
    var dob: String?
    var phone: String?
    var loginUserName: String?
    var loginPassword: String?
    
    private func validateEmail(with email: String) {
        
    }
    
    func validate(for validationPage: ValidationPage) -> (isValid: Bool, error: ValidationError) {
        switch validationPage {
        case .login:
            guard let email = self.loginUserName, !email.isEmpty else { return (false, ValidationError.emailEmpty)}
            guard let password = self.loginPassword, !password.isEmpty else { return (false, ValidationError.passwordEmpty) }
            guard email.isValidEmail else { return (false, ValidationError.inavlidEmail)}
            return (true, ValidationError.none)
        case .signup:
            guard let firstName = self.firstName, !firstName.isEmpty else { return (false, ValidationError.firstNameEmpty)}
            guard let lastName = self.lastName, !lastName.isEmpty else { return (false, ValidationError.lastNameEmpty)}
            guard let email = self.email, !email.isEmpty else { return (false, ValidationError.emailEmpty)}
            self.validateEmail(with: email.trim())
            guard let gender = self.gender, !gender.isEmpty else { return (false, ValidationError.genderEmpty)}
            return (true, ValidationError.none)
        }
    }
    
    func updateModel(forField field: ValidatingField, withValue value: String) {
        
        switch field {
        case .firstName:
            self.firstName = value
        case .lastName:
            self.lastName = value
        case .emailField:
            self.email = value
        case .dobField:
            self.dob = value
        case .loginEmail:
            self.loginUserName = value
        case .loginPassword:
            self.loginPassword = value
        case .phoneNumber:
            self.phone = value
        default:
            break
        }
    }
}
