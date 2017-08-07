//
//  AppDelegate.swift
//  ProductList
//
//  Created by dima on 8/2/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var realm = try! Realm()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //let utilityQueue = DispatchQueue.global(qos: .utility)
        
        try! realm.write {
             realm.deleteAll()
        }
        
        //utilityQueue.async {
        //DispatchQueue.global().async {
        //DispatchQueue(label: "background").async {
        self.ImportGroup()
        self.ImporProducts()
        //}
        //}
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
//MARK: - Import Data
    
    func ImportGroup() {
        //Import Groups
        if let path = Bundle.main.path(forResource: "Group", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    //try! realm.write {
                    realm.beginWrite()
                    for obj in jsonObj {
                            let group = GroupModelRealm()
                            group.id = obj.1["id"].int!
                            group.name = obj.1["name"].string!
                            realm.add(group)
                        }
                        print("finish upload groups")
                    try! realm.commitWrite()
                    //}
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
        print("Invalid filename/path.")
        }
    }
    
    func ImporProducts() {
        if let path = Bundle.main.path(forResource: "Products", ofType: "json") {
            do {
                let data = try Data(contentsOf:URL(fileURLWithPath: path),options: .alwaysMapped)
                let jsonObj = JSON(data:data)
                if jsonObj != JSON.null {
                    //try! realm.write {
                    realm.beginWrite()
                    for obj in jsonObj {
                            let product = ProductModelRealm()
                            var myvalue = realm.objects(ProductModelRealm.self).map{$0.id}.max() ?? 0
                            myvalue = myvalue + 1
                            product.id = myvalue
                            product.name = obj.1["name"].string!
                            product.groupId = obj.1["groupId"].int!
                            realm.add(product)
                        }
                        print("finish upload products")
                    try! realm.commitWrite()
                    //}
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        
        }
    
    


}

