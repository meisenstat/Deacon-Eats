//
//  ProfileViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 3/27/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
//        self.tabBarController?.tabBar.isHidden = true
        super.viewWillDisappear(animated)
    }
    
}
