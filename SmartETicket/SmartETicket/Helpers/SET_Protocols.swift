//
//  SET_Protocols.swift
//  SmartETicket
//
//  Created by Ramprasad A on 14/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardInstantinatable {
    func instantinateViewController<T: UIViewController>(ofType type: ViewControllerType, of storyBoard: StoryBoardType) -> T
}

protocol RootSwitchable {
    func setRootNavController(toType type: NavigationControllerType, ofStoryBoard storyBoard: StoryBoardType)
}

extension UIViewController: StoryBoardInstantinatable { }
extension UIViewController: RootSwitchable { }
