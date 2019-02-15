//
//  Item.swift
//  Todoey
//
//  Created by Brandon Lehr on 2/15/19.
//  Copyright © 2019 Brandon Lehr. All rights reserved.
//

import Foundation

class Item : Codable {
    var title : String = ""
    var done : Bool = false
    
    init() {
        
    }
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
