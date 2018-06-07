//
//  MainViewController.swift
//  RXSwiftExample
//
//  Created by Nguyen Huu Minh on 6/7/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let disposeBag = DisposeBag()
    
    var shownCities = [String]()
    var allCities = ["Oklahoma", "Chicago", "Moscow", "Danang", "Vancouver", "Praga", "HongKong", "Japan", "HaNoi"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar
            .rx.text // Observable property
            .orEmpty // Make it non-optional
            .debounce(0.5, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
            .subscribe(onNext: { [unowned self] query in // Here we subscribe to every new value, that is not empty (thanks to filter above).
                self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
                self.tableView.reloadData() // And reload table view data.
            })
            .addDisposableTo(disposeBag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }
}
