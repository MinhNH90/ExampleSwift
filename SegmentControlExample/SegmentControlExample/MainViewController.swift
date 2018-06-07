//
//  MainViewController.swift
//  SegmentControlExample
//
//  Created by Nguyen Huu Minh on 6/7/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var lblState: UILabel?
    @IBOutlet weak var segment: UISegmentedControl?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedValueChanged(sender: UISegmentedControl) {
        lblState?.text = "You selected : \(sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "")"
    }
}
