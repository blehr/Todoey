//
//  Category.swift
//  Todoey
//
//  Created by Brandon Lehr on 2/16/19.
//  Copyright © 2019 Brandon Lehr. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
