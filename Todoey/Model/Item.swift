//
//  Item.swift
//  Todoey
//
//  Created by Louis Menacho on 3/22/18.
//  Copyright © 2018 Louis Menacho. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
