//
//  MainViewController.swift
//  CollectionViewExample
//
//  Created by Nguyen Huu Minh on 3/15/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView?
    let cellID = "ExampleCell"
    
    let cellSpacing: CGFloat = 10
    
    // Set data
    var foodList: [Food] = foodData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.backgroundColor = .white
        
        // CollectionView settings
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        
        collectionView?.register(FoodCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.delegate = self
        collectionView?.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // UICollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FoodCollectionCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan : .orange
//        cell.selectedBackgroundView = UIView()
//        cell.selectedBackgroundView?.backgroundColor = .red
        cell.autolayoutCell()
        cell.food = foodList[indexPath.row]
        
        return cell
    }
    
    // UICollectionView DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 3 * cellSpacing) / 2
        let height = width

//        let width = (UIScreen.main.bounds.size.width - 3 * cellSpacing) / 2
//        let height = (UIScreen.main.bounds.size.height - 4 * cellSpacing) / 3
        
        return CGSize(width: width, height: height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
