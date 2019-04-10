//
//  ProfileSubViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 3/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class ProfileSubViewController: UIViewController {
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        super.viewWillAppear(animated)
    }
    
}
