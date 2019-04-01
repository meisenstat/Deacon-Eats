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
    var listings = ["data", "from", "database"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickUpButton = UIButton(frame: CGRect(x: 300, y: 100, width: 100, height: 50))
        pickUpButton.backgroundColor = .blue
        pickUpButton.setTitle("Pick-Up", for: .normal)
        
        self.view.addSubview(pickUpButton)
}
    
    
}

