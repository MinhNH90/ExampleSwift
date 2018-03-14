//
//  UIStackView+Extentions.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func changeBackgroundColor(color: UIColor) {
        let backgroundLayer = CAShapeLayer()
        self.layer.insertSublayer(backgroundLayer, at: 0)
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = color.cgColor
    }
}
