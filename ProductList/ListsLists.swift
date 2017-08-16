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

class ListsLists: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {

//MARK: - UICollectionViewDataSource
    
    let realm = try! Realm()
    let resultLists = try! Realm().objects(ListModelRealm.self)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultLists.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellLists", for: indexPath) as! CollectionViewCellLists
        cell.name.text = resultLists[indexPath.row].name
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
