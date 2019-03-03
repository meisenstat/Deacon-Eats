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
    
    @IBOutlet var navBar: UINavigationItem!
    let locations = ["Benson", "Subway", "Zicks", "Einsteins"]
    
    override func viewDidLoad() {
        
        addTitle()
        addOptionsButton()
        
        self.tableView.rowHeight = 50
        self.tableView.tableFooterView = UIView()
        super.viewDidLoad()
    }
    
    func addTitle() {
        let navBarLabel = UILabel()
        navBarLabel.textColor = UIColor.black
        navBarLabel.text = "Deacon Eats"
        navBarLabel.font = UIFont.boldSystemFont(ofSize: navBarLabel.font.pointSize)
        self.navBar.leftBarButtonItem = UIBarButtonItem.init(customView: navBarLabel)
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
//        if(self.dataToPass.count == 0){
//            let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath)
//            cell.textLabel?.text = "Network error. Please refresh app."
//            cell.textLabel?.textColor = UIColor.red
//            return cell
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = self.locations[indexPath.row]
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
        }
        return cell
    }
    
    
}
