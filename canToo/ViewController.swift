//
//  ViewController.swift
//  canToo
//
//  Created by Maxiel De Jesus on 4/5/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var toucanTut: UIImageView!
    @IBOutlet weak var canTooLabel: UILabel!
    
    let tapRecon = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tapRecon.addTarget(self, action: #selector(ViewController.tappedView))
        toucanTut.isUserInteractionEnabled = true;
        
        toucanTut.addGestureRecognizer(tapRecon)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    func tappedView(){
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "quotePopUp") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
}


