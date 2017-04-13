//
//  Parse.swift
//  canToo
//
//  Created by Maxiel De Jesus on 4/12/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import Foundation

//Will transfer data to the label controller

protocol ParseProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class Parse: NSObject, URLSessionDataDelegate {
    
    weak var delegate: ParseProtocol!
    var data: NSMutableData = NSMutableData()
    
    let urlPath: String = "https://web.njit.edu/~mid6/service.php"
    
    //Retrieves data from DB and handles it 
    
    func downloadItems(){
        
        let url : URL = URL(string: urlPath)!
        let request = URLRequest(url: url)
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        //Starts data retrieval process
        
        let task = session.dataTask(with: request)
        
        task.resume()
        
    }
    
    //Stores the data retrieved into dynamic data object "data"
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data){
        
        self.data.append(data as Data);
    }
    
    //Check to see if data was retrieved w/o error and then calls the parseJSON method
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
        if error != nil {
            print("Failed to download data")
        }
        else{
            print("Data downloaded")
            self.parseJSON()
        }
    }
    
    //Parses through data recieved from URLSession 
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        //var jsonResult = (data as! NSArray).mutableCopy() as! NSMutableArray

        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableArray
            
            print(jsonResult)
            
            //jsonResult = try json
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        
        let quotes: NSMutableArray = NSMutableArray()
        
        
        //for quote in (jsonResult as NSArray)
        
        for i in 0..<jsonResult.count
        {
            //Store data in dictionary in key-value pairs
            
            print(jsonResult[i])
            
           //left offf righ
            
            jsonElement = jsonResult[i] as! String as! NSDictionary
            
            //Will store each element in the specific JSON object we defined in IncomingData.swift
            
            let data = IncomingData()
            
            //Insures none of the JsonElement values are nil through optional binding
            
            if let quote = jsonElement["quote"] as? String, let author = jsonElement["author"] as? String
            {
                
                data.quote = quote
                data.author = author
              
                
            }
            
            //Adds objects to an array that will be sent to view controller via protocol method
           
            quotes.add(data)
            
        }
        
        //Closure allows us to use the quotes array in the view controller immediately?
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: quotes)
            
        })
    }
    
    
}
