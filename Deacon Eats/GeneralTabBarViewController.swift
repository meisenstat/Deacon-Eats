//
//  GeneralTabBarViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 2/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class GeneralTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.selectedIndex = 1
        
        self.tabBar.items![0].title = "Listings"
        self.tabBar.items![1].title = "New Order"
        self.tabBar.items![2].title = "Profile"
        
//        self.tabBar.items![0].image = .Favorites
    }
    
}
