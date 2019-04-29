//
//  OrderInformationView.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 4/28/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class OrderInformationView: UITableViewController {
    
    var information: Dictionary = ["Destination": "", "Name": "", "Instructions": "", "Location": "", "Phone Number": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.topItem?.title = "Order Information"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonClicked(sender:)))
        
        self.tableView.tableFooterView = UIView()
        var label = UILabel(frame: CGRect(x:0, y: 100, width: self.view.frame.width, height: 100))
        label.textAlignment = .center
        label.text = "Please reach out to the eater to coordinate drop off"
        label.numberOfLines = 0
        self.tableView.tableFooterView?.addSubview(label)
    }
    
    @objc func doneButtonClicked(sender: UIBarButtonItem) {
        let storyBoad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoad.instantiateViewController(withIdentifier: "ListingsPage") as! ListingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    
    
    
    
    // table view settings
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = Array(information)[indexPath.row].key + ": " + Array(information)[indexPath.row].value
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
