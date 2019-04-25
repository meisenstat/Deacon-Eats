//
//  NewOrderViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class NewOrderViewController: UITableViewController {
    
    var locations = ["Chic-fil-a", "Subway", "Zicks", "Einsteins", "Legal Grounds", "Campus Grounds", "Shorty's", "Starbucks ZSR", "Starbucks North Campus", "Forest Greens", "Moes", "Asian Fusion"]
    var selected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locations.sort()
        addTitle()
//        addOptionsButton()
        
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
