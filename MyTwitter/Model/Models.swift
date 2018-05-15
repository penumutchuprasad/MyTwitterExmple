//
//  Models.swift
//  MyTwitter
//
//  Created by Leela Prasad on 09/05/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

struct User: Codable {
    
    var name: String!
    var userName: String!
    var bioText: String!
    
    //var profImage: UIImage!
    
    
}


struct Tweet {
    
    var user: User
    var message: String
    
}
