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
    private let user = "User"
    private let password = "Password"
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.user = user
    }

    // MARK: IBActions
    @IBAction func logInPressed() {
        if userNameTextField.text != user || passwordTextField.text != password {
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
