//
//  LoginViewController.swift
//  SmartETicket
//
//  Created by Ramprasad A on 25/01/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: RM_TextField!
    @IBOutlet weak var passwordTextField: RM_TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNotificationObservers()
        self.view.layer.contents = UIImage(named: "theme_image")?.cgImage
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Forgot Password..?", message: "Please Enter your registered e-mail, you will get the password reset link", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter your e-mail"
        }
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController {
    
    func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillAppear(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillAppear(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyBoardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                UIView.animate(withDuration: 0.5, animations: {
                    if self.view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyBoardHeight
                    }
                }, completion: nil)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0.0
    }
}

