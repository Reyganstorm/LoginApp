//
//  WelcomeViewController.swift
//  Login App
//
//  Created by Руслан Штыбаев on 28.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user  = ""

        private let primaryColor = UIColor(
            red: 200/255,
            green: 120/255,
            blue: 80/255,
            alpha: 1
        )
        private let secondaryColor = UIColor(
            red: 80/255,
            green: 148/255,
            blue: 230/255,
            alpha: 1
        )
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
            welcomeLabel.text = "Welcome, \(user)!"
        }
    }
    

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
