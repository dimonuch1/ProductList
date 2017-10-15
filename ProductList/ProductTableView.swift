//
//  ProductTableView.swift
//  ProductList
//
//  Created by dima on 10/15/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ProductTableView: UITableView,UITableViewDelegate,UITableViewDataSource {

    var countCell:Int?
    var listProducts:Results<ProductModelRealm>?
    
    
    //MARK: - UITableViewDataSource
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countCell ?? 0
    }
    
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        
        cell.name.text = listProducts![indexPath.row].name
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}
