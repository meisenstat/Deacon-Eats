//
//  Remove_ListingTableView.swift
//  Deacon Eats
//
//  Created by Ben  Folds on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation

import UIKit

class listingData {
    
    var userName:String
    var pickUp: String
    var dropOff: String
    var expireTime: String
    
    init() {
        userName = ""
        pickUp = ""
        dropOff = ""
        expireTime = ""
    }
    
    init(userName: String, pickUp:String, dropOff: String, expireTime: String) {
        self.userName = userName
        self.pickUp = pickUp
        self.dropOff = dropOff
        self.expireTime = expireTime
    }
}

class Remove_ListingTableView: UITableViewController {
    
    var listOfListings : [listingData] = []
    
   // var listings = ["data", "from", "database"]
    var selected = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orderOne = listingData(userName: "Bob", pickUp: "Moes", dropOff: "Dogwood", expireTime: "12:30:08")
        let orderTwo = listingData(userName: "Alice", pickUp: "Subway", dropOff: "Babcock", expireTime: "12:30:08")
        let orderThree = listingData(userName: "Phil", pickUp: "Zicks", dropOff: "Kitchin", expireTime: "12:30:08")
        let orderFour = listingData(userName: "Laurie", pickUp: "CFA", dropOff: "Taylor", expireTime: "12:30:08")
        let orderFive = listingData(userName: "Jack", pickUp: "CFA", dropOff: "ZSR", expireTime: "12:30:08")
        let orderSix = listingData(userName: "Alex", pickUp: "VillJui", dropOff: "Benson", expireTime: "12:30:08")
        let orderSeven = listingData(userName: "Sally", pickUp: "ForGree", dropOff: "South", expireTime: "12:30:08")
        
        listOfListings = [orderOne, orderTwo, orderThree, orderFour, orderFive, orderSix, orderSeven]
        

        
        self.tableView.rowHeight = 50
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    
    
    func addTarget(_ target: UIView?, action: Selector, for controlEvents: UIControl.Event) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.listOfListings.count == 0){
            return 1
        }
        return self.listOfListings.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = self.listOfListings[indexPath.row].userName + "  |   " + self.listOfListings[indexPath.row].pickUp +  "  |   " + self.listOfListings[indexPath.row].dropOff + "  |   " + self.listOfListings[indexPath.row].expireTime
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row: " + String(indexPath.row))
        selected = listOfListings[indexPath.row].userName + "  |   " + self.listOfListings[indexPath.row].pickUp +  "  |   " + self.listOfListings[indexPath.row].dropOff
        
        self.performSegue(withIdentifier: "pickUpScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pickUpScreen") {
            print("sel: " + selected)
            let newVC = segue.destination as! PickUpView
            newVC.selected = selected
        }
    }

   /* @objc func buttonAction(sender: UIButton!) {
        
        
        print("Button tapped")
        
    } */
       
}

