//
//  AppManager.swift
//  SmartETicket
//
//  Created by Ramprasad A on 13/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

class AppManager: NSObject {
    
    static func initialSetup() {
        IQKeyboardManager.shared.enable = true
    }
}
