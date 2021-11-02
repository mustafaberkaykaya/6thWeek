//
//  LoginViewController.swift
//  6thWeek
//
//  Created by Mustafa Berkay Kaya on 2.11.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    private var newUser = AppUser(name: "firstPerson", userStatus: .failed, age: 19)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } 
    
    @IBAction private func signInTapped(_ sender: Any) {
        
        if usernameTextField.text?.isEmpty ?? false || passwordTextField.text?.isEmpty ?? false {
           showAlert(title: "Error", message: "Please fill in the required fields.")
            newUser.name = usernameTextField.text ?? "none"
            newUser.age = 20
            newUser.userStatus = .succes
        } else {
            newUser.name = usernameTextField.text ?? "none"
            newUser.age = 20
            newUser.userStatus = .failed
        }
    }
    
   func showAlert(title: String, message: String) {
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    
    }

}
