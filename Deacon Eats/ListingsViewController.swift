//
//  ListingsViewController.swift
//  Deacon Eats
//
//  Created by Elizabeth Dicus on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

//struct CellData{
//    let userName : String?
//    let pickUp : String?
//    let dropOff: String?
//    let expierTime: NSDate?
//}

class listing {
    
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


class ListingsViewController: UITableViewController {
    
    var listOfListings : [listing] = []
    var selected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        let orderOne = listing(userName: "Bob", pickUp: "Moes", dropOff: "Dogwood", expireTime: "12:30:08")
        let orderTwo = listing(userName: "Alice", pickUp: "Subway", dropOff: "Babcock", expireTime: "12:30:08")
        let orderThree = listing(userName: "Phil", pickUp: "Zicks", dropOff: "Kitchin", expireTime: "12:30:08")
        let orderFour = listing(userName: "Laurie", pickUp: "CFA", dropOff: "Taylor", expireTime: "12:30:08")
        let orderFive = listing(userName: "Jack", pickUp: "CFA", dropOff: "ZSR", expireTime: "12:30:08")
        let orderSix = listing(userName: "Alex", pickUp: "VillJui", dropOff: "Benson", expireTime: "12:30:08")
        let orderSeven = listing(userName: "Sally", pickUp: "ForGree", dropOff: "South", expireTime: "12:30:08")
        
         listOfListings = [orderOne, orderTwo, orderThree, orderFour, orderFive, orderSix, orderSeven]
        
        let headerView: UIView = UIView.init(frame: CGRect(x:1, y:50, width:276, height:44))
        headerView.backgroundColor = UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1.0)
        
        let usernameButton = UIButton()
        usernameButton.frame = CGRect(x: 0, y: 0, width: 70, height: 44)
        usernameButton.setTitle("Username", for: .normal)
        usernameButton.setTitleColor(UIColor.black, for: .normal)
        usernameButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        let pickupButton = UIButton()
        pickupButton.frame = CGRect(x: usernameButton.frame.maxX, y: 0, width: 70, height: 44)
        pickupButton.setTitle("Pick Up", for: .normal)
        pickupButton.setTitleColor(UIColor.black, for: .normal)
        pickupButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        let dropoffButton = UIButton()
        usernameButton.frame = CGRect(x: pickupButton.frame.maxX, y: 0, width: 70, height: 44)
        dropoffButton.setTitle("Drop Off", for: .normal)
        dropoffButton.setTitleColor(UIColor.black, for: .normal)
        dropoffButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        self.tableView.tableHeaderView = headerView
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfListings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        
        cell.textLabel?.text = self.listOfListings[indexPath.row].userName + "  |   " + self.listOfListings[indexPath.row].pickUp +  "  |   " + self.listOfListings[indexPath.row].dropOff + "  |   " + self.listOfListings[indexPath.row].expireTime
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row: " + String(indexPath.row))
        selected = listOfListings[indexPath.row].userName + "  |   " + self.listOfListings[indexPath.row].pickUp +  "  |   " + self.listOfListings[indexPath.row].dropOff + "  |   " + self.listOfListings[indexPath.row].expireTime
        
        self.performSegue(withIdentifier: "pickUpScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pickUpScreen") {
            print("sel: " + selected)
            let newVC = segue.destination as! PickUpView
            newVC.selected = selected
        }
    }
    
}
