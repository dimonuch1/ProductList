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
        listsLists.dataSource = listsLists
        listsLists.delegate = listsLists
        //reloadView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadView()
    }
    
//MARK: - somefunction
    func reloadView() {
        if resultLists.count > 0 {
            
            self.view.viewWithTag(3)?.removeFromSuperview()
            self.view.viewWithTag(4)?.removeFromSuperview()
            listsLists.reloadData()
            listsLists.isHidden = false
        } else {
            listsLists.isHidden = true
            
            let image = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.width/3)))
            image.center = CGPoint(x: self.view.center.x, y: self.view.center.y - (self.view.center.y / 5))
            image.tag = 3
            image.image = UIImage(named: "List")
            image.isUserInteractionEnabled = true
            self.view.addSubview(image)
            
            let str = "  Создайте свой первый список - просто нажмите на синюю кнопку"
            let lable = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.width/3)))
            lable.numberOfLines = 2
            lable.textColor = UIColor.gray
            lable.text = str
            lable.tag = 4
            lable.font=UIFont.systemFont(ofSize: 21)
            
            self.view.addSubview(lable)
            lable.translatesAutoresizingMaskIntoConstraints = false
            self.view.addConstraint(NSLayoutConstraint(item: lable, attribute: .top, relatedBy: .equal,toItem:  image, attribute: .bottom, multiplier: 1.0, constant: 5))
            
            self.view.addConstraint(NSLayoutConstraint(item: lable, attribute: .leadingMargin, relatedBy: .equal,toItem: self.view, attribute: .leadingMargin, multiplier: 1.0, constant: 10))
            self.view.addConstraint(NSLayoutConstraint(item: lable, attribute: .trailingMargin, relatedBy: .equal,toItem:  self.view, attribute: .trailingMargin, multiplier: 1.0, constant: -10))
        }
    }
}
