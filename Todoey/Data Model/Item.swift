//
//  Item.swift
//  Todoey
//
//  Created by Brandon Lehr on 2/16/19.
//  Copyright © 2019 Brandon Lehr. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
