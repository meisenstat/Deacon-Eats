//
//  setup.swift
//  Deacon Eats
//
//  Created by Ben  Folds on 3/17/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation

class listing {
    
    var userName:String
    var location: String
    var destination: String
    var expireTime: NSDate
    
    init() {
        userName = ""
        location = ""
        destination = ""
        expireTime = NSDate()
    }
    
    init(userName: String, location:String, destination: String, expireTime: NSDate) {
        self.userName = userName
        self.location = location
        self.destination = destination
        self.expireTime = expireTime
    }
}

var orderOne = listing(userName: "Bob", location: "Moes", destination: "Dogwood", expireTime: NSDate())
var orderTwo = listing(userName: "Alice", location: "Subway", destination: "Babcock", expireTime: NSDate())
var orderThree = listing(userName: "Phil", location: "Zicks", destination: "Kitchen", expireTime: NSDate())


