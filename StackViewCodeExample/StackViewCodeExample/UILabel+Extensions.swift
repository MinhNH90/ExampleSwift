//
//  UILabel+Extensions.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String?, fontSize: CGFloat, parentStackView: UIStackView) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = self.font?.withSize(fontSize)
        parentStackView.addArrangedSubview(self)
    }
}
