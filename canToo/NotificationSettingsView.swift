//
//  NotificationSettingsView.swift
//  canToo
//
//  Created by Maxiel De Jesus on 5/4/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit

class NotificationSettingsView: UIViewController {

    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

    @IBAction func stepperValueChange(_ sender: AnyObject) {
        
        counter.text = "\(Int(stepper.value))"

    }
    
}
