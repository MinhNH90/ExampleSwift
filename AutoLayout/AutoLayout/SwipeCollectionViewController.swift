//
//  SwipeCollectionViewController.swift
//  AutoLayout
//
//  Created by Nguyen Huu Minh on 2018/08/27.
//  Copyright © 2018 Nguyen Huu Minh. All rights reserved.
//

import UIKit

let reuseIdentifier = "PageCellId"

class SwipeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let preButton: UIButton = {
        let preButton = UIButton(type: .system)
        preButton.setTitle("Previous", for: .normal)
        preButton.setTitleColor(.red, for: .normal)
        preButton.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        preButton.translatesAutoresizingMaskIntoConstraints = false
        
        return preButton
    } ()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageModels.count
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    } ()
    
    let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        return nextButton
    } ()
    
    var pageModels = [
        PageModel(image: #imageLiteral(resourceName: "icon-lifeform1"), headerText: "Welcome to Nodejs tutorials"),
        PageModel(image: #imageLiteral(resourceName: "icon-lifeform3"), headerText: "React Native tutorials"),
        PageModel(image: #imageLiteral(resourceName: "icon-lifeform5"), headerText: "Vue.js tutorials"),
        PageModel(image: #imageLiteral(resourceName: "icon-lifeform2"), headerText: "Swift 4 tutorials"),
        PageModel(image: #imageLiteral(resourceName: "icon-lifeform4"), headerText: "Angular 5 tutorials")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(PageCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.isPagingEnabled = true
        collectionView?.backgroundColor = .white
        
        layoutBottom()
    }
    
    fileprivate func layoutBottom() {
        let bottomStackView = UIStackView(arrangedSubviews: [preButton, pageControl, nextButton])
        bottomStackView.distribution = .fillEqually
        bottomStackView.axis = .horizontal
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomStackView)
        NSLayoutConstraint.activate([bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     bottomStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    @objc func handlePrevious(sender: Any) {
        let previousIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: previousIndex, section: 0)
        
        pageControl.currentPage = previousIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handleNext(sender: Any) {
        let nextIndex = min(pageControl.currentPage + 1, pageModels.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
