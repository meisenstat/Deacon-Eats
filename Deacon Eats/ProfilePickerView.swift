//
//  ProfilePickerView.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 4/29/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class ProfilePickerView: UIViewController {
    
    @IBOutlet weak var userOneButton: UIButton!
    @IBOutlet weak var userTwoButton: UIButton!
    
    public static var userID = ""
    public static var user: Dictionary = ["email": "", "firstname": "", "lastname": "", "phone": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userOneButton.addTarget(self, action: #selector(userOnePicked), for: .touchUpInside)
        userTwoButton.addTarget(self, action: #selector(userTwoPicked), for: .touchUpInside)
    }
    
    @objc func userOnePicked() {
        ProfilePickerView.userID = "userone"
        ProfilePickerView.user["email"] = "userone@gmail.com"
        ProfilePickerView.user["firstname"] = "User One"
        ProfilePickerView.user["lastname"] = ""
        ProfilePickerView.user["phone"] = "1234567890"
    }
    
    @objc func userTwoPicked() {
        ProfilePickerView.userID = "usertwo"
        ProfilePickerView.user["email"] = "usertwo@gmail.com"
        ProfilePickerView.user["firstname"] = "User Two"
        ProfilePickerView.user["lastname"] = ""
        ProfilePickerView.user["phone"] = "9876543210"
    }
    
}
