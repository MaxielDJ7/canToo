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
    
    let quoteArray: NSMutableArray = NSMutableArray()
    
    let tapRecon = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tapRecon.addTarget(self, action: #selector(ViewController.tappedView))
        toucanTut.isUserInteractionEnabled = true;
        
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
    
    
    
    @IBAction func tappedView(_ sender: Any) {
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
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "popUpSegue"
        {
            if let destinationVC = segue.destination as? PopUpViewController {
                destinationVC.newArray = quoteArray
            }
        }
    }

    
    
}


