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
    var expireTime: NSDate
    
    init() {
        userName = ""
        pickUp = ""
        dropOff = ""
        expireTime = NSDate()
    }
    
    init(userName: String, pickUp:String, dropOff: String, expireTime: NSDate) {
        self.userName = userName
        self.pickUp = pickUp
        self.dropOff = dropOff
        self.expireTime = expireTime
    }
}




class ListingsViewController: UITableViewController {
    
//    var scrollView: UIScrollView!
//    var imageView: UIImageView!
    var listOfListings : [listing] = []
    //var data = [CellData]()
    
    
    //override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orderOne = listing(userName: "Bob", pickUp: "Moes", dropOff: "Dogwood", expireTime: NSDate())
        let orderTwo = listing(userName: "Alice", pickUp: "Subway", dropOff: "Babcock", expireTime: NSDate())
        let orderThree = listing(userName: "Phil", pickUp: "Zicks", dropOff: "Kitchin", expireTime: NSDate())
        let orderFour = listing(userName: "Laurie", pickUp: "CFA", dropOff: "Taylor", expireTime: NSDate())
        let orderFive = listing(userName: "Jack", pickUp: "CFA", dropOff: "ZSR", expireTime: NSDate())
        let orderSix = listing(userName: "Alex", pickUp: "VillJui", dropOff: "Benson", expireTime: NSDate())
        let orderSeven = listing(userName: "Sally", pickUp: "ForGree", dropOff: "South", expireTime: NSDate())
        
         listOfListings = [orderOne, orderTwo, orderThree, orderFour, orderFive, orderSix, orderSeven]
        
        let headerView: UIView = UIView.init(frame: CGRect(x:1, y:50, width:276, height:30))
        headerView.backgroundColor = UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1.0)
        
        //let labelView: UILabel = UILabel.init(frame: CGRect(x:4, y:5, width:276, height:24))
        //labelView.text = "hello"
        let labelView = UIButton()
        labelView.setTitle("test", for: .normal)
        
        headerView.addSubview(labelView)
        self.tableView.tableHeaderView = headerView
        
//        scrollView = UIScrollView(frame: view.bounds)
//        //scrollView.backgroundColor = UIColor.blackColor()
//        scrollView.contentSize = imageView.bounds.size
//        //scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
//
//        scrollView.addSubview(imageView)
//        view.addSubview(scrollView)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfListings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = self.listOfListings[indexPath.row].userName
        return cell
    }
    
}


// + self.listOfListings[indexPath.row].pickUp + self.listOfListings[indexPath.row].dropOff + Formatter.string(self.listOfListings[indexPath.row].expireTime)
