//
//  WelcomeViewController.swift
//  LogInDemo
//
//  Created by ALEKSEY SUSLOV on 15.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = person.fullName
    }
}
