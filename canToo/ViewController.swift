//
//  ViewController.swift
//  canToo
//
//  Created by Maxiel De Jesus on 4/5/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import Darwin

class ViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var toucanTut: UIImageView!
    @IBOutlet weak var canTooLabel: UILabel!
    
    @IBOutlet weak var settingsGear: UIImageView!
    
        
    let quoteArray: NSMutableArray = NSMutableArray()
    
    let tapRecon = UITapGestureRecognizer()
    
    var previousQuote : UInt32 = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tapRecon.addTarget(self, action: #selector(ViewController.tappedView))
        
        toucanTut.isUserInteractionEnabled = true
        toucanTut.addGestureRecognizer(tapRecon)
        

        
        
        let urlPath: String = "https://web.njit.edu/~mid6/service.php"
        
        //Retrieves data from DB and handles it
        
        if let url = URL(string: urlPath){
            
            if let data = try? Data(contentsOf: url){
                let json = try? JSON(data: data)
                
                //print(json!)
                
                parse(json: json!)
                
            }
        }

    }
    
    //MARK: Actions
    
    
    
    @IBAction func tappedView(gesture: UIGestureRecognizer, sender: Any) {
        

        self.performSegue(withIdentifier: "popUpSegue", sender: self)
            

    }
    
   
   
    
    
    func parse(json: JSON) {
        
        for(i , object) in json{
            
            let quote = object["quote"].stringValue
            let author = object["author"].stringValue
            
            //print(quote)
            
            let data = IncomingData()
            
            data.quote = quote
            data.author = author
            
            quoteArray.add(data)
           
            //print(data)
        }
        
        appointmentNotification()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "popUpSegue"
        {
            if let destinationVC = segue.destination as? PopUpViewController {
                destinationVC.newArray = quoteArray
            }
        }
        
    }
    
    
    
    //Creates local notifications
    
    func appointmentNotification(){
        
        var randomQuote = arc4random_uniform(UInt32(quoteArray.count))
        
        while previousQuote == randomQuote{
            randomQuote = arc4random_uniform(UInt32(quoteArray.count))
        }
        previousQuote = randomQuote
        
        let content = UNMutableNotificationContent()
        content.title = "Just when you think you can't..."
        content.body = String(describing: quoteArray[Int(randomQuote)])
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 30, repeats: false)
        let request = UNNotificationRequest.init(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            print(error as Any)
        }
        print ("Should recieve notification in 10 sec")
        
    }
 
}


