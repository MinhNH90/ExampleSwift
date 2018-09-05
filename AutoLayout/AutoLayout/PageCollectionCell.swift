//
//  PageCollectionCell.swift
//  AutoLayout
//
//  Created by Nguyen Huu Minh on 2018/08/27.
//  Copyright © 2018 Nguyen Huu Minh. All rights reserved.
//

import UIKit

class PageCollectionCell: UICollectionViewCell {
    private let topHalfView: UIView = {
        let topHalfView = UIView()
        topHalfView.translatesAutoresizingMaskIntoConstraints = false
        
        return topHalfView
    } ()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icon-lifeform2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    } ()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.text = "Welcome to my amazing app !"
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    } ()
    
    fileprivate func initContrains() {
        self.backgroundColor = .white
        
        self.addSubview(topHalfView)
        NSLayoutConstraint.activate([topHalfView.topAnchor.constraint(equalTo: self.topAnchor),
                                     topHalfView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     topHalfView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     topHalfView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)])
        
        topHalfView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topHalfView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topHalfView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        self.addSubview(textView)
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    var pageModel: PageModel? {
        didSet {
            self.imageView.image = pageModel?.image
            self.textView.text = pageModel?.headerText ?? ""
            self.textView.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
