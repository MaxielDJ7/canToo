//
//  PopUpViewController.swift
//  canToo
//
//  Created by Maxiel De Jesus on 4/5/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : IncomingData = IncomingData()
    
    var newArray: NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var quoteText: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
       checkQuotes()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.view.removeFromSuperview()
    
    }

    
    /* Will need function to loop through feeditems, detect if popUp has 
        been initialized again, and present a different quote */
    
    func checkQuotes(){
     
     //print("count is: ")
     // print(quoteArray.count)
     
        let otherVC = ViewController()
        
        print(otherVC)
        
        newArray = otherVC.quoteArray
        
        print(newArray.count)
        
        /*for i in 0..<newArray.count{
     
            print("okay")
            
     
        }*/
     }
    
    

}
