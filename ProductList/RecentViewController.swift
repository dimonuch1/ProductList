//
//  RecentViewController.swift
//  ProductList
//
//  Created by dima on 10/15/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RecentViewController: UIViewController {

    @IBOutlet weak var recentTableView: ProductTableView!
    
    let predicate = NSPredicate(format: "recent = \(true)")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentTableView.countCell = try! Realm().objects(ProductModelRealm.self).filter(predicate).count
        recentTableView.listProducts = try! Realm().objects(ProductModelRealm.self).filter(predicate)
        recentTableView.dataSource = recentTableView
        
       //self.tabBarController?.selectedIndex
            
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
