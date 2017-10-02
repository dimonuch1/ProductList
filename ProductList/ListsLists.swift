//
//  ListsLists.swift
//  ProductList
//
//  Created by dima on 8/8/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ListsLists: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

//MARK: - UICollectionViewDataSource
    
    //MARK: - Structs screen size
    
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
    
    var leftAndRightInsert: CGFloat {
        get {
            if DeviceType.IS_IPHONE_4_OR_LESS {
                return 8.0
            } else if DeviceType.IS_IPHONE_5 {
                return 10.0
            } else if DeviceType.IS_IPHONE_6_7 {
                return 13.0
            } else if DeviceType.IS_IPHONE_6P_7P {
                return 15.0
            } else {
                return 22.0
            }
        }
    }
    
    var textFontSize: CGFloat {
        get {
            if DeviceType.IS_IPHONE_4_OR_LESS {
                return 16.0
            } else if DeviceType.IS_IPHONE_5 {
                return 17.0
            } else if DeviceType.IS_IPHONE_6_7 {
                return 23.0
            } else if DeviceType.IS_IPHONE_6P_7P {
                return 25.0
            } else {
                return 30.0
            }
        }
    }
    
   
    
    let realm = try! Realm()
    let resultLists = try! Realm().objects(ListModelRealm.self)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultLists.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellLists", for: indexPath) as! CollectionViewCellLists
        cell.name.text = resultLists[indexPath.row].name
        cell.name.font = UIFont(name: cell.name.font.fontName, size: textFontSize)
        cell.layer.cornerRadius  = 3
        cell.layer.shadowColor   = UIColor.black.cgColor
        cell.layer.shadowRadius  = 1
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset  = CGSize(width: 0, height: 1)
        
        cell.clipsToBounds       = false
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: leftAndRightInsert, bottom: 10, right: leftAndRightInsert)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        return CGSize(width: width - leftAndRightInsert * 2 , height: height / 7)
    }
    
}
