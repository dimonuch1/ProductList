//
//  ProductModelRealm.swift
//  ProductList
//
//  Created by dima on 8/3/17.
//  Copyright © 2017 dima. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ProductModelRealm: Object {
    
    dynamic var name = ""
    dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}



