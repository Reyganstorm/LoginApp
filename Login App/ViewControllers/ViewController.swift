//
//  ViewController.swift
//  Login App
//
//  Created by Руслан Штыбаев on 28.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Private Properties
    private let user = Person.init().login
    private let password = Person.init().password
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as? UITabBarController
        let viewControllers = tabBarController?.viewControllers
        for viewController in viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = Person.init().name
                welcomeVC.surname = Person.init().surname
            } else if let navigationVC = viewController as? UINavigationController {
                let pageVC = navigationVC.topViewController as! PageViewController
                pageVC.name = Person.init().name
                pageVC.surname = Person.init().surname
                pageVC.age = Person.init().age
                pageVC.codeExperience = Person.init().codeExperience
                pageVC.someInformation = Person.init().someInformation
                pageVC.wishes = Person.init().wishes
                
            }
        }
    }


    // MARK: IBActions
    @IBAction func logInPressed() {
        if userNameTextField.text != user
            || passwordTextField.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password."
            )
        }
    }
    
    @IBAction func forgotRegistredData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops", message: "Your name is \(user).")
            : showAlert(title: "Oops", message: "Your password id \(password).")
    }
    
    @IBAction func unwindSegue( segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    }

// MARK: - Private Methods
extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK:
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "ShowWelcomeVC", sender: nil)
        }
        return true
    }
}
