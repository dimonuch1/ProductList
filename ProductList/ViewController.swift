//
//  ViewController.swift
//  ProductList
//
//  Created by dima on 8/2/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var addList: UIButton!
    
    @IBOutlet weak var listsLists: ListsLists!
    
    let resultLists = try! Realm().objects(ListModelRealm.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if resultLists.count > 0 {
            
        } else {
            listsLists.isHidden = true
           
            //var image = UIImageView(frame: CGRect(origin: <#T##CGPoint#>, size: <#T##CGSize#> )
            let image = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.width/3)))
            image.center = self.view.center
            image.image = UIImage(named: "List")
            //image.backgroundColor = UIColor.red
            self.view.addSubview(image)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

