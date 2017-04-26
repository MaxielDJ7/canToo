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
    
        //checkQuotes()
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
    
    
    /*func checkQuotes(){
        
        //print("count is: ")
       // print(quoteArray.count)
        
        
        for i in 0..<quoteArray.count{
        
            print(quoteArray[i])
            
            
            
        }
    }*/
    
    
    
    
}


