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
    
    var selectedLocation : IncomingData = IncomingData()
    
    var newArray: NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var quoteText: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       checkQuotes()
        
    }

    //Actions
    
    @IBAction func closePopUp(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {})
        //print("close")
    
    }
    
    // check is quoteArray passed over
    
    func checkQuotes(){
        
        for i in 0..<newArray.count{
            print(newArray[i])
            
        }
   
     }


}
