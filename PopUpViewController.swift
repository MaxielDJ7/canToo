//
//  PopUpViewController.swift
//  canToo
//
//  Created by Maxiel De Jesus on 4/5/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, ParseProtocol {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : IncomingData = IncomingData()
    
    @IBOutlet weak var quoteText: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        
        //set delegates & initialize Parse
        
        let parse = Parse()
        parse.delegate = self
        parse.downloadItems()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.view.removeFromSuperview()
    
    }
    
    func itemsDownloaded(items:NSArray){
        
        feedItems = items
        for quote in feedItems{
            
            // Come back and edit this
            self.quoteText.text = quote as? String
        }
        
    }
    
    /* Will need function to loop through feeditems, detect if popUp has 
        been initialized again, and present a different quote */
    
    
    
    

}
