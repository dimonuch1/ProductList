//
//  List.swift
//  ProductList
//
//  Created by dima on 8/7/17.
//  Copyright © 2017 dima. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ListModelRealm: Object {
    
    dynamic var name = ""
    dynamic var id = 0
    let productss = List<ProductModelRealm>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
