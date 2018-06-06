//
//  MainViewController.swift
//  ScenesAndSeguesExample
//
//  Created by Nguyen Huu Minh on 6/6/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var txtData: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMainViewController(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "Screen1ToMain" {
            let scene1ViewController = unwindSegue.source as! Screen1ViewController
            print("Data from Screen1: \(scene1ViewController.txtData?.text ?? "")")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToScreen1" {
//            let scene1ViewController = segue.destination as! Screen1ViewController
//            scene1ViewController.textFromMainVC = txtData?.text ?? ""
            
            DataPassing.shared.textToPassing = txtData?.text ?? ""
        }
    }
}
