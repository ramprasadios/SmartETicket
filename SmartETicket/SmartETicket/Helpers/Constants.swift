//
//  Constants.swift
//  SmartETicket
//
//  Created by Ramprasad A on 13/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation

enum alertButtons: String {
    case ok = "OK"
    case cancel = "Cancel"
    case done = "Done"
    case update = "Update"
}

enum Key: String {
    case forgotPassword = "FORGOT_PASSWORD"
    case emailErrorAlert = "FORGOT_PASSWORD_EMIAL_ALERT"
    case emailPlaceholder = "EMAIL_PLACEHOLDER"
    
    var localizableString: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

struct Constants {
    
    struct DictKeys {
        static let hasTextField: String = "hasTextField"
        static let placeHolder: String = "placeHolder"
        static let titleString: String = "alertTitle"
        static let alertMsg: String = "alertMsg"
        static let actionTypes: String = "alertActions"
    }
    
    struct ErrorKeys {
        static let noEmailError: String = "EMAIL_ADDRESS_EMPTY"
        static let noMobileError: String = "MOBILE_NUMBER_EMPTY"
        static let noPasswordError: String = "PASSWORD_EMPTY"
        static let noFirstNameError: String = "FIRST_NAME_EMPTY"
        static let noLastNameError: String = "LAST_NAME_EMPTY"
        static let noDOBError: String = "FIRST_NAME_EMPTY"
    }
}
