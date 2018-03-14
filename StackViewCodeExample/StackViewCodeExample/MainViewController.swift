//
//  MainViewController.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainStackView: UIStackView = UIStackView()
    
    var topStackView: UIStackView = UIStackView()
    var imageView: UIImageView = UIImageView()
    
    var labelStackView: UIStackView = UIStackView()
    var labelFirst: UILabel?
    var labelMiddle: UILabel?
    var labelLast: UILabel?
    
    var fieldStackView: UIStackView = UIStackView()
    var fieldFirst: UITextField?
    var fieldMiddle: UITextField?
    var fieldLast: UITextField?
    
    var textViewDescription: UITextView = UITextView()
    
    var buttonStackView: UIStackView = UIStackView()
    var buttonCancel: UIButton?
    var buttonSave: UIButton?
    var buttonClear: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.autolayoutMainStackView()
        self.autolayoutTopStackView()
        self.autolayoutTextViewDescription()
        self.autolayoutButtonStackView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func autolayoutMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: UIDevice.setSize(iPhone: 30, iPad: 50)).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = UIDevice.setSize(iPhone: 10, iPad: 20)
    }
    
    private func autolayoutTopStackView() {
        mainStackView.addArrangedSubview(topStackView)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.heightAnchor.constraint(equalToConstant: UIDevice.setSize(iPhone: 100, iPad: 200)).isActive = true
        
        // topStackView settings
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fill
        topStackView.spacing = UIDevice.setSize(iPhone: 10, iPad: 20)
        
        // Autolayout for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "background")
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        topStackView.addArrangedSubview(imageView)
        
        // Autolayout fo labelStackView
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.addArrangedSubview(labelStackView)
        labelStackView.axis = .vertical
        labelStackView.alignment = .leading
        labelStackView.distribution = .equalSpacing
        labelStackView.spacing = UIDevice.setSize(iPhone: 10, iPad: 20)
        
        labelFirst = UILabel.init(text: "First", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), parentStackView: labelStackView)
        labelMiddle = UILabel.init(text: "Middle", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), parentStackView: labelStackView)
        labelLast = UILabel.init(text: "Last", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), parentStackView: labelStackView)
        
        labelStackView.widthAnchor.constraint(equalToConstant: UIDevice.setSize(iPhone: 70, iPad: 100)).isActive = true
        
        // Autolayout fo fieldStackView
        fieldStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.addArrangedSubview(fieldStackView)
        fieldStackView.axis = .vertical
        fieldStackView.alignment = .fill
        fieldStackView.distribution = .equalSpacing
        fieldStackView.spacing = 0
        
        fieldFirst = UITextField.init(placeholder: "First", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), borderStyle: .roundedRect, parentStackView: fieldStackView)
        fieldMiddle = UITextField.init(placeholder: "Middle", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), borderStyle: .roundedRect, parentStackView: fieldStackView)
        fieldLast = UITextField.init(placeholder: "Last", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), borderStyle: .roundedRect, parentStackView: fieldStackView)
    }
    
    private func autolayoutTextViewDescription() {
        mainStackView.addArrangedSubview(textViewDescription)
        textViewDescription.text = "Your description..."
        textViewDescription.font = textViewDescription.font?.withSize(UIDevice.setSize(iPhone: 15, iPad: 22))
        textViewDescription.backgroundColor = UIColor(234.0, 221.0, 209.0)
        textViewDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func autolayoutButtonStackView() {
        mainStackView.addArrangedSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = UIDevice.setSize(iPhone: 10, iPad: 20)
        buttonStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        buttonCancel = UIButton.init(title: "Cancel", backgroundColor: UIColor(121.0, 200.0, 166.0),  parentStackView: buttonStackView)
        buttonSave = UIButton.init(title: "Save", backgroundColor: UIColor(121.0, 200.0, 166.0),  parentStackView: buttonStackView)
        buttonClear = UIButton.init(title: "Clear", backgroundColor: UIColor(121.0, 200.0, 166.0),  parentStackView: buttonStackView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
