//
//  UIDevice+Extensions.swift
//  StackViewCodeExample
//
//  Created by Nguyen Huu Minh on 3/14/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    static func setSize(iPhone: CGFloat, iPad: CGFloat) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iPhone
            
        case .pad:
            return iPad
            
        default:
            return 0
        }
    }
}
