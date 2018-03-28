//
//  Category.swift
//  Todoey
//
//  Created by Louis Menacho on 3/22/18.
//  Copyright © 2018 Louis Menacho. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
