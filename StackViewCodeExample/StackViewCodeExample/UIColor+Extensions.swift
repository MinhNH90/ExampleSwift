//
//  UIColor+Extensions.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}
