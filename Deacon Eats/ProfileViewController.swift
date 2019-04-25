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
    
    @IBOutlet weak var currentOrdersButton: UIButton!
    @IBOutlet weak var orderHistoryButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    var buttonSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        buttonSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func buttonSetup() {
        currentOrdersButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
        orderHistoryButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
        aboutButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
        helpButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
    }
    
    @objc func moveToNextView(sender: UIButton) {
        buttonSelected = (sender.titleLabel?.text)!
        
        switch((sender.titleLabel?.text)!) {
        case "Current Orders":
            self.performSegue(withIdentifier: "toCurrentSegue", sender: self)
            break;
        case "Order History":
            self.performSegue(withIdentifier: "toHistorySegue", sender: self)
            break;
        case "Settings":
            self.performSegue(withIdentifier: "toSettingsSegue", sender: self)
            break;
        case "Privacy":
            self.performSegue(withIdentifier: "toPrivacySegue", sender: self)
            break;
        case "About":
            self.performSegue(withIdentifier: "toAboutSegue", sender: self)
            break;
        case "Help":
            self.performSegue(withIdentifier: "toHelpSegue", sender: self)
            break;
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newVC = segue.destination as! ProfileSubViewController
        newVC.pageName = buttonSelected
        
    }
    
}
