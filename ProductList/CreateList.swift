//
//  ViewController.swift
//  ProductList
//
//  Created by dima on 8/9/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit

class CreateList: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setColorBarMenu()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setColorBarMenu() {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds (to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor.blue
        }
        
        UINavigationBar.appearance().backgroundColor =  UIColor.blue
        //UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }
}
