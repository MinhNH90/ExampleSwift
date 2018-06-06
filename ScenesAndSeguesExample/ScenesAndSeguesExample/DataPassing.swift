//
//  DataPassing.swift
//  ScenesAndSeguesExample
//
//  Created by Nguyen Huu Minh on 6/6/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
class DataPassing {
    // Singleton pattern
    static let shared = DataPassing()
    var textToPassing: String?
}
