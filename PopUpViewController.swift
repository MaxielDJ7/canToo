//
//  PopUpViewController.swift
//  canToo
//
//  Created by Maxiel De Jesus on 4/5/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var quoteText: UILabel!
    var quoteArray : [String] = ["Hello", "Just Checking"]

    override func viewDidLoad() {
        super.viewDidLoad()
        changeQuote()
        
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: action
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.view.removeFromSuperview()
    
    }
    
    func changeQuote(){
        self.quoteText.text = "Changed"
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}
