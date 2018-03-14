//
//  UITextField+Extensions.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    convenience init(placeholder: String?, fontSize: CGFloat, borderStyle: UITextBorderStyle, parentStackView: UIStackView) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.font = self.font?.withSize(fontSize)
        self.borderStyle = borderStyle
        parentStackView.addArrangedSubview(self)
    }
}
