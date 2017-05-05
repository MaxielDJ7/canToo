//
//  TableViewController.swift
//  canToo
//
//  Handles the settings view and populates the table with desire setting options from an array
//
//
//  Created by Maxiel De Jesus on 5/4/17.
//  Copyright © 2017 Maxiel De Jesus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var settingsRows = ["Notifications"]
    var myIndex = 0
        
        
    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

     // Creates rows
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        
        return settingsRows.count
    }

    // Creates cell with option
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        
        cell.textLabel?.text = settingsRows[indexPath.row]

        return cell
    }
    
    // Directs the selected option to it appropriate view

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "notificationSegue", sender: self)
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
