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
    
    private var validation: ValidationHandler = ValidationHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage(named: "theme_image")?.cgImage
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: Key.forgotPassword.localizableString, message: Key.emailErrorAlert.localizableString, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = Key.emailPlaceholder.localizableString
        }
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        let result = self.validation.validate(for: .login)
        if result.isValid {
            print(result.error.localizedDescription)
            self.setRootNavController(toType: .homeNavigation, ofStoryBoard: .home)
        } else {
            self.showNormalAlert(withTitle: "Error...!", andMessage: result.error.localizedDescription)
            print(result.error.localizedDescription)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            let field = ValidationHandler.ValidatingField(rawValue: textField.tag)!
            self.validation.updateModel(forField: field, withValue: updatedText)
        }
        return true
    }
}

