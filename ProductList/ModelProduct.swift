//
//  ModelProduct.swift
//  ProductList
//
//  Created by dima on 10/15/17.
//  Copyright © 2017 dima. All rights reserved.
//

import Foundation
import RealmSwift

class Product:Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var mediaPath = ""
    dynamic var desc = ""
    //dynamic var basePackaging:ProductPackage?
    //let packaging = List<ProductPackage>()
    var selected = RealmOptional<Bool>()
    let parents = LinkingObjects(fromType: ProductGroups.self, property: "products")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    
}
