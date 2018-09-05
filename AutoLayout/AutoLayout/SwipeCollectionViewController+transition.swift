//
//  SwipeCollectionViewController+transition.swift
//  AutoLayout
//
//  Created by Nguyen Huu Minh on 2018/08/31.
//  Copyright © 2018 Nguyen Huu Minh. All rights reserved.
//

import Foundation
import UIKit
extension SwipeCollectionViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            if(self.pageControl.currentPage == 0) {
                self.collectionView?.contentOffset = .zero
            } else {
                self.collectionViewLayout.invalidateLayout()
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
}
