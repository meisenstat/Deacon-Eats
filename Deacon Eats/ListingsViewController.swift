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


//public class MultiColumnCell : UITableViewCell
//{
//    public static String ID = "MultiColumnCell";
//
//    public UILabel LeftValue { get set }
//    public UILabel RightValue { get set}
//
//    public MultiColumnCell()
//{
//    LeftValue = new UILabel(new RectangleF(0, 0, 150, 50));
//    RightValue = new UILabel(new RectangleF(150, 0, 150, 50));
//    LeftValue.BackgroundColor = UIColor.Red;
//    RightValue.BackgroundColor = UIColor.Green;
//
//    AddSubview(LeftValue);
//    AddSubview(RightValue);
//    }
//
//}



class ListingsViewController: UITableViewController {
    
//    var scrollView: UIScrollView!
//    var imageView: UIImageView!
    var listOfListings : [listing] = []
    //var data = [CellData]()
    
    
    //override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        //let labelView: UILabel = UILabel.init(frame: CGRect(x:4, y:5, width:276, height:24))
        //labelView.text = "hello"
        let usernameButton = UIButton()
        usernameButton.frame = CGRect(x: 0, y: 0, width: 70, height: 44)
        usernameButton.setTitle("Username", for: .normal)
        usernameButton.setTitleColor(UIColor.black, for: .normal)
        usernameButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //headerView.addSubview(usernameButton)
        
        
        let pickupButton = UIButton()
        pickupButton.frame = CGRect(x: usernameButton.frame.maxX, y: 0, width: 70, height: 44)
        pickupButton.setTitle("Pick Up", for: .normal)
        pickupButton.setTitleColor(UIColor.black, for: .normal)
        pickupButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //headerView.addSubview(pickupButton)
        
        
        let dropoffButton = UIButton()
        usernameButton.frame = CGRect(x: pickupButton.frame.maxX, y: 0, width: 70, height: 44)
        dropoffButton.setTitle("Drop Off", for: .normal)
        dropoffButton.setTitleColor(UIColor.black, for: .normal)
        dropoffButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //headerView.addSubview(dropoffButton)
        
        /*
        let expireTimeButton = UIButton()
        expireTimeButton.frame = CGRect(x: 150, y: 0, width: 50, height: 44)
        expireTimeButton.setTitle("", for: .normal)
        expireTimeButton.setTitleColor(UIColor.black, for: .normal)
        headerView.addSubview(expireTimeButton)
 */
        
     
        
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
//        cell.label1.text = self.listOfListings[indexPath.row].userName
//        cell.label2.text = self.listOfListings[indexPath.row].pickUp
//        cell.label3.text = [NSString stringWithFormat:@"End %ld", (long)indexPath.row];
        cell.textLabel?.text = self.listOfListings[indexPath.row].userName + "  |   " + self.listOfListings[indexPath.row].pickUp +  "  |   " + self.listOfListings[indexPath.row].dropOff + "  |   " + self.listOfListings[indexPath.row].expireTime
        return cell
    }
    
}


// + self.listOfListings[indexPath.row].pickUp + self.listOfListings[indexPath.row].dropOff + Formatter.string(self.listOfListings[indexPath.row].expireTime)
