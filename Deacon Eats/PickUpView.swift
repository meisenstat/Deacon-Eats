//
//  PickUpView.swift
//  Deacon Eats
//
//  Created by Ben  Folds on 4/1/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation

import UIKit
import FirebaseDatabase

class PickUpView: UIViewController {
     @IBOutlet var pickUpButton: UIButton!
     @IBOutlet weak var label: UILabel?
    var selected = ""
    var listingID = ""
    
    var destination = ""
    var nameID = ""
    var instructions = ""
    var location = ""
    var name = ""
    var phonenumber = ""
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.topItem?.title = "Confirm Pickup"
        
        pickUpButton = UIButton(frame: CGRect(x:100, y: 500, width: 100, height: 50))
        pickUpButton.center = self.view.center
        pickUpButton.backgroundColor = .blue
        pickUpButton.setTitle("Pick-Up", for: .normal)
        pickUpButton.addTarget(self, action: #selector(displayInfo(sender:)), for: .touchUpInside)
       
        self.view.addSubview(pickUpButton)
    
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 50, y: 50, width: 250, height: 50)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left
        label.text = selected
        self.view.addSubview(label)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    
    @IBAction func displayInfo (sender: UIButton!) {
      // send info to database
       
        ref = Database.database().reference()
        ref.child("listings").child(listingID).child("active").setValue(false) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                
            }
        }
        
        ref.child("listings").child(self.listingID).child("runnername").setValue(ProfilePickerView.userID) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                
                let storyBoad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = storyBoad.instantiateViewController(withIdentifier: "orderInformation") as! OrderInformationView
                nextViewController.information["Destination"] = self.destination
                nextViewController.information["Name"] = self.name
                nextViewController.information["Instructions"] = self.instructions
                nextViewController.information["Location"] = self.location
                nextViewController.information["Phone Number"] = self.phonenumber
                self.navigationController?.pushViewController(nextViewController, animated: true)
                
            }
        }
        
    }
   
    
}
    


