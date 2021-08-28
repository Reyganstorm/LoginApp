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
    @IBOutlet var passwordNextField: UITextField!
    
    // MARK: Private Properties
    private let user = "User"
    private let password = "Password"
    
    @IBAction func forgotRegistredData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops", message: "Your name is \(user).")
            : showAlert(title: "Oops", message: "Your password id \(password).")
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
