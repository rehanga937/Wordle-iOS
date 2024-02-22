//
//  StatsViewController.swift
//  Wordle iOS
//
//  Created by Rehanga Gamage on 2024-02-22.
//

import UIKit
import SwiftUI

class StatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let wordleRecords = ViewController.Load()
        print("No. of stats:")
        print(wordleRecords?.count ?? "No stats found.")
        
        if wordleRecords != nil {
            print("entered here")
            let tableForChart = PrepareRecordsForChart(records: wordleRecords!)
            for item in tableForChart {
                print(item.value)
            }
            let vc = UIHostingController(rootView: StatsViewSwiftUI(tableForChart: tableForChart))
            vc.view.frame = CGRectMake(0, 0, 350, 450);
            view.addSubview(vc.view)
        }
        
        
    }
    

    func PrepareRecordsForChart(records:[WordleRecord]) -> [ValuePerCategory] {
        
        var data: [ValuePerCategory] = [
            .init(category: "1 Attempt", value: 0),
            .init(category: "2 Attempts", value: 0),
            .init(category: "3 Attempts", value: 0),
            .init(category: "4 Attempts", value: 0),
            .init(category: "5 Attempts", value: 0),
            .init(category: "6 Attempts", value: 0),
            .init(category: "Loss", value: 0),
        ]
        
        for record in records {
            data[Int(record.numOfAttempts) - 1].value += 1
        }
        return data
    }

}
