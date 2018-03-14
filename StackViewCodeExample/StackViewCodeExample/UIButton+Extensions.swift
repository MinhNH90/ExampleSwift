//
//  UIButton+Extensions.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String?, backgroundColor: UIColor, parentStackView: UIStackView) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        parentStackView.addArrangedSubview(self)
    }
}
