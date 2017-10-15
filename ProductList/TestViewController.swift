//
//  TestViewController.swift
//  ProductList
//
//  Created by dima on 10/12/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    let colors:[UIColor] = [UIColor.red,UIColor.blue,UIColor.gray]
    
    //@IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var coll: TestSuka!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coll.dataSource = coll
        //coll.prefetchDataSource = coll as! UICollectionViewDataSourcePrefetching

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
