//
//  Screen1ViewController.swift
//  ScenesAndSeguesExample
//
//  Created by Nguyen Huu Minh on 6/6/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class Screen1ViewController: UIViewController {
    @IBOutlet weak var lblData: UILabel?
    @IBOutlet weak var txtData: UITextField?
    
    var textFromMainVC: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        lblData?.text = textFromMainVC
        lblData?.text = DataPassing.shared.textToPassing    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
