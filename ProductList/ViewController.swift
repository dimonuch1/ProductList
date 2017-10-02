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

extension UINavigationBar {
    
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var addList: UIButton!
    
    @IBOutlet weak var listsLists: ListsLists!
    
    let resultLists = try! Realm().objects(ListModelRealm.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        listsLists.dataSource = listsLists
        listsLists.delegate = listsLists
        
        //reloadView()
        //setInsetsForCollectionView()
        navigationController?.navigationBar.transparentNavigationBar()
        setColors()
    }
    
    func setColors() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.green
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds (to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor(red: 80/255, green: 200/255, blue: 120/255, alpha: 1.0)
        }
    }

    func setInsetsForCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width  = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        layout.itemSize = CGSize(width: width * 0.95 , height: height / 7)
        listsLists.collectionViewLayout = layout
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
            lable.font = UIFont.systemFont(ofSize: 21)
            
            self.view.addSubview(lable)
            lable.translatesAutoresizingMaskIntoConstraints = false
            self.view.addConstraint(NSLayoutConstraint(item: lable, attribute: .top, relatedBy: .equal,toItem:  image, attribute: .bottom, multiplier: 1.0, constant: 5))
            
            self.view.addConstraint(NSLayoutConstraint(item: lable, attribute: .leadingMargin, relatedBy: .equal,toItem: self.view, attribute: .leadingMargin, multiplier: 1.0, constant: 10))
            self.view.addConstraint(NSLayoutConstraint(item: lable, attribute: .trailingMargin, relatedBy: .equal,toItem:  self.view, attribute: .trailingMargin, multiplier: 1.0, constant: -10))
        }
        setColors()
    }
}
