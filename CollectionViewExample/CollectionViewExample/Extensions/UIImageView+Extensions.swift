//
//  UIImageView+Extensions.swift
//  CollectionViewExample
//
//  Created by Nguyen Huu Minh on 4/18/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    public func getImageFromURL(urlString: String) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: {(data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: {() -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
