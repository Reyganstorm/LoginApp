//
//  PageViewController.swift
//  Login App
//
//  Created by Руслан Штыбаев on 29.08.2021.
//

import UIKit

class PageViewController: UIViewController {
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var codeExperienceLabel: UILabel!
    @IBOutlet var informationAboutMeLabel: UILabel!
    @IBOutlet var whishesLabel: UILabel!
    
    var name = ""
    var surname = ""
    var age = ""
    var codeExperience = ""
    var someInformation = ""
    var wishes = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        surnameLabel.text = surname
        ageLabel.text = age
        codeExperienceLabel.text = codeExperience
        informationAboutMeLabel.text = someInformation
        whishesLabel.text = wishes
    }
    

}
