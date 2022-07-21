//
//  JobViewController.swift
//  LogInDemo2
//
//  Created by ALEKSEY SUSLOV on 21.07.2022.
//

import UIKit

class JobViewController: UIViewController {

    @IBOutlet weak var jobNameLabel: UILabel!
    @IBOutlet weak var jobInfoLabel: UILabel!
    
    var job: Job!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobNameLabel.text = job.name
        jobInfoLabel.text = job.info
    }
}
