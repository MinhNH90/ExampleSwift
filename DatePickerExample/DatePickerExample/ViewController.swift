//
//  ViewController.swift
//  DatePickerExample
//
//  Created by Nguyen Huu Minh on 4/23/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDate: UILabel?
    @IBOutlet weak var labelTime: UILabel?
    @IBOutlet weak var datePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.minimumDate = Date.calculateDate(day: 1, month: 1, year: 1990, hour: 0, minute: 0)
        datePicker?.maximumDate = Date.calculateDate(day: 30, month: 12, year: 2018, hour: 0, minute: 0)
    }
    
    @IBAction func valueChange(sender: UIDatePicker, forEvent event: UIEvent) {
        labelDate?.text = "Date : \(sender.date.getDayMonthYearHourMinuteSecond().day)/\(sender.date.getDayMonthYearHourMinuteSecond().month)/\(sender.date.getDayMonthYearHourMinuteSecond().year)"
        labelTime?.text = "Time : \(sender.date.getDayMonthYearHourMinuteSecond().hour):\(sender.date.getDayMonthYearHourMinuteSecond().minute):\(sender.date.getDayMonthYearHourMinuteSecond().second)"
    }
}

