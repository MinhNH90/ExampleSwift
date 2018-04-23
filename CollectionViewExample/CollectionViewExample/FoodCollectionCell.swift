//
//  FoodCollectionCell.swift
//  CollectionViewExample
//
//  Created by Nguyen Huu Minh on 4/16/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class FoodCollectionCell: UICollectionViewCell {
    var stackView: UIStackView = UIStackView()
    var imageView: UIImageView = UIImageView()
    var labelFoodName: UILabel = UILabel()
    var labelFoodDescription: UILabel = UILabel()
    
    func autolayoutCell() {
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true;
        
        // Autolayout imageView
        stackView.addArrangedSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "image_1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2.0/3.0).isActive = true
        
        // Autolayout labelFoodName
        labelFoodName.translatesAutoresizingMaskIntoConstraints = false
        labelFoodName.text = "Food name"
        labelFoodName.font = UIFont.boldSystemFont(ofSize: 15)
        stackView.addArrangedSubview(labelFoodName)
        
        // Autolayout labelFoodDescription
        labelFoodDescription.translatesAutoresizingMaskIntoConstraints = false
        labelFoodDescription.text = "Food description"
        labelFoodDescription.font = UIFont.systemFont(ofSize: 15)
        stackView.addArrangedSubview(labelFoodDescription)
        
        // StackView setting
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
    }
    
    var food: Food! {
        didSet {
//            imageView.image = UIImage(named: food.imageName!)
            imageView.getImageFromURL(urlString: food.imageURL ?? "")
            labelFoodName.text = food.foodName ?? ""
            labelFoodDescription.text = food.foodDescription ?? ""
        }
    }
}
