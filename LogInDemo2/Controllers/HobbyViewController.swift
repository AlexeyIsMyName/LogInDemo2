//
//  HobbyViewController.swift
//  LogInDemo2
//
//  Created by ALEKSEY SUSLOV on 21.07.2022.
//

import UIKit

class HobbyViewController: UIViewController {
    
    @IBOutlet weak var hobbyNameLabel: UILabel!
    @IBOutlet weak var hobbyInfoLabel: UILabel!
    
    var hobby: Hobby!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hobbyNameLabel.text = hobby.name
        hobbyInfoLabel.text = hobby.info
    }
}
