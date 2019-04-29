//
//  ListingsViewController.swift
//  Deacon Eats
//
//  Created by Elizabeth Dicus on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

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
    var instructions: String
    
    init() {
        userName = ""
        pickUp = ""
        dropOff = ""
        expireTime = ""
        instructions = ""
    }
    
    init(userName: String, pickUp:String, dropOff: String, expireTime: String, instructions: String) {
        self.userName = userName
        self.pickUp = pickUp
        self.dropOff = dropOff
        self.expireTime = expireTime
        self.instructions = instructions
    }
}


class ListingsViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var listOfListings : [listing] = []
    var listingIDs: [String] = []
    
    var selected = ""
    var selectedID = ""
    var destination = ""
    var name = ""
    var instructions = ""
    var location = ""
    var realName = ""
    var phoneNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        
        getFirebaseData()
        
        let headerView: UIView = UIView.init(frame: CGRect(x:1, y:50, width:276, height:44))
        headerView.backgroundColor = UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1.0)
        
        let reloadButton = UIButton()
        reloadButton.frame = CGRect(x: 0, y: 0, width: 70, height: 44)
        let img = UIImage(named: "reloadImage")
//        img.tint
        reloadButton.setImage(img, for: .normal)
        reloadButton.tintColor = UIColor.blue
        reloadButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        reloadButton.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
        headerView.addSubview(reloadButton)
        reloadButton.showsTouchWhenHighlighted = true
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    Get listings data from firebase to display on tableview
    func getFirebaseData() {
        ref = Database.database().reference()
        
        // Using this to handle async firebase call
        let group = DispatchGroup()
        group.enter()
        
//                ----------------- READ LISTINGS -----------------
        ref.child("listings").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.listingIDs = value!.allKeys as! [String]
            for key in self.listingIDs {
                let order = value![key] as! [String: AnyObject]
                
                if(order["active"] as! Bool == true){
                    let expire: String = String(order["expire"] as! Int)
                    let tmpListing = listing(userName: order["eatername"] as! String, pickUp: order["location"] as! String, dropOff: order["destination"] as! String, expireTime: expire, instructions: order["instructions"] as! String)
                    self.listOfListings.append(tmpListing)
                } else {
                    self.listingIDs = self.listingIDs.filter { $0 != key }
                }
            }
            group.leave()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        // Once firebase returns data, reload tableview with listings
        group.notify(queue: DispatchQueue.main, execute: {
            self.tableView.reloadData()
        })
    }
    
    @objc func reloadData() {
        print("reload")
        listOfListings.removeAll()
        getFirebaseData()
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
        
        // Very bad way of doing this - should find permanent solution
        selectedID = listingIDs[indexPath.row]
        destination = listOfListings[indexPath.row].dropOff
        name = listOfListings[indexPath.row].userName
        instructions = listOfListings[indexPath.row].instructions
        location = listOfListings[indexPath.row].pickUp
        
        ref = Database.database().reference()
        // Using this to handle async firebase call
        let group = DispatchGroup()
        group.enter()
        
        //                ----------------- READ PROFILE INFO -----------------
        ref.child("profiles").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            var profileIDs = value!.allKeys as! [String]
            for key in profileIDs {
                let profile = value![key] as! [String: String]
                
                if(key == self.name) {
                    self.realName = profile["firstname"]! + " " + profile["lastname"]!
                    self.phoneNumber = profile["phone"]!
                }
            }
            group.leave()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        // Once firebase returns data, reload tableview with listings
        group.notify(queue: DispatchQueue.main, execute: {
            self.performSegue(withIdentifier: "pickUpScreen", sender: self)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pickUpScreen") {
            print("sel: " + selected)
            let newVC = segue.destination as! PickUpView
            newVC.selected = selected
            newVC.listingID = selectedID
            
            newVC.destination = destination
            newVC.nameID = name
            newVC.instructions = instructions
            newVC.location = location
            
            newVC.name = realName
            newVC.phonenumber = phoneNumber
            
        }
    }
    
}
