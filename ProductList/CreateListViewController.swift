//
//  CreateListViewController.swift
//  ProductList
//
//  Created by dima on 8/9/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class CreateListViewController: UIViewController {

    @IBOutlet weak var viewWithButtons: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6_7        = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P_7P      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH   == 1024.0
        static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH   == 1366.0
    }
    
    var textFontSize: CGFloat {
        get {
            if DeviceType.IS_IPHONE_4_OR_LESS {
                return 14.0
            } else if DeviceType.IS_IPHONE_5 {
                return 14.0
            } else if DeviceType.IS_IPHONE_6_7 {
                return 21.0
            } else if DeviceType.IS_IPHONE_6P_7P {
                return 23.0
            } else {
                return 28.0
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorBarMenu()
        viewWithButtons.layer.cornerRadius = 5
        self.view.backgroundColor = UIColor(red: 76/255, green: 149/255, blue: 230/255, alpha: 1)
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        textField.font = UIFont(name: (textField.font?.fontName)!, size: textFontSize)
        // Do any additional setup after loading the view.
    
    
    
    navigationController?.navigationBar.transparentNavigationBar()
    setColors()
    
    }

    func setColors() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 76/255, green: 149/255, blue: 230/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds (to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor(red: 61/255, green: 134/255, blue: 251/255, alpha: 1)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setColorBarMenu() {
        
        //UIApplication.shared.statusBarStyle = .lightContent
        
        
        
        
        
        //UINavigationBar.appearance().backgroundColor =  UIColor.blue
        //UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.characters.count == 0 {
            label.isHidden = true
        } else {
            label.isHidden = false
        }
    }
    
    @IBAction func createList(_ sender: UIButton) {
        if (textField.text?.characters.count)! > 0 {
            let realm = try! Realm()
            realm.beginWrite()
            let list = ListModelRealm()
            var myvalue = realm.objects(ListModelRealm.self).map{$0.id}.max() ?? 0
            myvalue = myvalue + 1
            list.id = myvalue
            list.name = textField.text!
            realm.add(list)
            try! realm.commitWrite()
            navigationController?.popViewController(animated: true)
        }
    }

}
