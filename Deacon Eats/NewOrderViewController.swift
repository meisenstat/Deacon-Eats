//
//  NewOrderViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class NewOrderViewController: UITableViewController {
    
    var locations = ["Chic-fil-a", "Subway", "Zicks", "Einsteins", "Legal Grounds", "Campus Grounds", "Shorty's", "Starbucks ZSR", "Starbucks North Campus", "Forest Greens", "Moes", "Asian Fusion"]
    var selected = ""
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
//        ----------------- READ LISTINGS -----------------
//        ref.child("listings").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            print(snapshot)
//            print(value)
//            print(value?.allKeys)
//
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
        
        
//        ----------------- WRITE LISTING -----------------
//        var newOrder: NSDictionary = ["active": true, "created": 201904081909, "eatername": "someone", "expire": 65, "location": "Panera", "runnername": "someone else"]
//        ref.child("listings").child("LST0005").setValue(newOrder)
        

//        ----------------- SET LISTING TO PICKED UP -----------------
//        var orderID = "LST0003"                 // This is the id that were going to update. Passed from prev view controller
//        var tmpOrder: Dictionary = ["active": true, "created": 201904081909, "eatername": "someone", "expire": 65, "location": "Panera", "runnername": "someone else"] as [String : Any]        //This is the dict passed through db that we will update
//        tmpOrder["active"] = false
//        let newOrder = tmpOrder as NSDictionary
//        ref.child("listings").child(orderID).setValue(newOrder)
        
        
        
        locations.sort()
        addTitle()
        addOptionsButton()
        
        self.tableView.rowHeight = 50
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func addTitle() {
        let navBarLabel = UILabel()
        navBarLabel.textColor = UIColor.black
        navBarLabel.text = "Deacon Eats"
        navBarLabel.font = UIFont.boldSystemFont(ofSize: navBarLabel.font.pointSize)
        self.navigationItem.title = "Deacon Eats"
    }
    
    func addOptionsButton() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.locations.count == 0){
            return 1
        }
        return self.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = self.locations[indexPath.row]
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row: " + String(indexPath.row))
        selected = locations[indexPath.row]
        self.performSegue(withIdentifier: "moveToOrder", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToOrder") {
            print("sel: " + selected)
            let newVC = segue.destination as! PlaceOrderViewController
            newVC.hidesBottomBarWhenPushed = true
            newVC.restaurant = selected
        }
    }
    
    
}
