//
//  PickUpView.swift
//  Deacon Eats
//
//  Created by Ben  Folds on 4/1/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation

import UIKit

class PickUpView: UIViewController {
     @IBOutlet var pickUpButton: UIButton!
     @IBOutlet weak var label: UILabel?
    var selected = ""
    
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    @IBAction func displayInfo (sender: UIButton!) {
        print("button clicked")
      // send info to database
       
//       uncomment once connect database to ensure data is loaded properly
//       sleep(1)
        
        let storyBoad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoad.instantiateViewController(withIdentifier: "ListingsPage") as! ListingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
//        self.present(nextViewController, animated: true, completion: nil)
    }
   
    
}
    


