//
//  CreateListViewController.swift
//  ProductList
//
//  Created by dima on 8/9/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit

class CreateListViewController: UIViewController {

    @IBOutlet weak var viewWithButtons: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorBarMenu()
        viewWithButtons.layer.cornerRadius = 5
        self.view.backgroundColor = UIColor(red: 76/255, green: 149/255, blue: 230/255, alpha: 1)
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
            statusBar.backgroundColor = UIColor(red: 61/255, green: 134/255, blue: 251/255, alpha: 1)
        }
        
        UINavigationBar.appearance().backgroundColor =  UIColor.blue
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }

}
