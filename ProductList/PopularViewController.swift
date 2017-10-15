//
//  PopularViewController.swift
//  ProductList
//
//  Created by dima on 10/15/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class PopularViewController: UIViewController {

    @IBOutlet weak var popularTableView: ProductTableView!
    
    let predicate = NSPredicate(format: "popular = \(true)")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popularTableView.countCell = try! Realm().objects(ProductModelRealm.self).filter(predicate).count
        popularTableView.listProducts = try! Realm().objects(ProductModelRealm.self).filter(predicate)
        popularTableView.dataSource = popularTableView
        
    }


}
