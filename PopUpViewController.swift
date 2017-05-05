//
//  PopUpViewController.swift
//  canToo
//
//  Handles the quote pop view:
//      - Generates quote
//      - Opens and closes view
//
//  Created by Maxiel De Jesus on 4/5/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit
import Darwin

class PopUpViewController: UIViewController {
    
    //Properties
    
    var selectedLocation : IncomingData = IncomingData()
    
    var newArray: NSMutableArray = NSMutableArray()
    
    var previousQuote : UInt32 = 0

    @IBOutlet weak var quoteText: UILabel!
    
    @IBOutlet weak var popUp: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUp.layer.cornerRadius = 10
        
        //checkQuotes()
        
        generateQuote()
        
    }

    //Actions
    
    //Dismisses segue
    
    @IBAction func closePopUp(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {})
        //print("close")
    
    }
    
    // check is quoteArray passed over
    
    /*func checkQuotes(){
        
        for i in 0..<newArray.count{
            //let random = arc4random_uniform(UInt32(newArray.count))
            //quoteText.text = String(describing: newArray[Int(random)])

            print(newArray[i])
            
        }
   
     }*/
    
    // Generates random number and presents the selected quote on the pop up
    
    func generateQuote(){
        var randomQuote = arc4random_uniform(UInt32(newArray.count))
        
        while previousQuote == randomQuote{
            randomQuote = arc4random_uniform(UInt32(newArray.count))
        }
        previousQuote = randomQuote
        quoteText.text = String(describing: newArray[Int(randomQuote)])
   
        
        
        
    }
 
    
    


}
