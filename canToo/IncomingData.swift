//
//  IncomingData.swift
//  canToo
//
//  This file contains the incoming JSON data
//
//
//  Created by Maxiel De Jesus on 4/12/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import Foundation

class IncomingData: NSObject {
    
    
    var quote: String?
    var author: String?
    
    override init()
    {
        
    }
    
    init(quote: String, author: String){
        
        self.quote = quote
        self.author = author
    }
    
    override var description: String {
        return "Quote: \(String(describing: quote)), Author: \(String(describing: author))"
    }
}
