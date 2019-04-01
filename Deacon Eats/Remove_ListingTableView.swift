//
//  Remove_ListingTableView.swift
//  Deacon Eats
//
//  Created by Ben  Folds on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation

import UIKit


class Remove_ListingTableView: UITableViewController {
    @IBOutlet var button: UIButton!
    var listings = ["data", "from", "database"]
    var selected = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
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
        if(self.listings.count == 0){
            return 1
        }
        return self.listings.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = self.listings[indexPath.row]
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row: " + String(indexPath.row))
        selected = listings[indexPath.row]
        
        self.performSegue(withIdentifier: "pickUpScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pickUpScreen") {
            print("sel: " + selected)
            let newVC = segue.destination as! PickUpView
            newVC.listings = [selected]
        }
    }

   /* @objc func buttonAction(sender: UIButton!) {
        
        
        print("Button tapped")
        
    } */
       
}

