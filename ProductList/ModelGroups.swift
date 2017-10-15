//
//  ModelGroups.swift
//  ProductList
//
//  Created by dima on 10/15/17.
//  Copyright © 2017 dima. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ProductGroups: Object {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var root = false
    var selected = RealmOptional<Bool>()
    var colapsed = RealmOptional<Bool>()
    dynamic var nesting = 0
    let products = List<Product>()
    let groups   = List<ProductGroups>()
    let parents  = LinkingObjects(fromType: ProductGroups.self, property: "groups")
    
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
