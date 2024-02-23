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
            let tableForChart = PrepareRecordsForChart(records: wordleRecords!)
            let vc = UIHostingController(rootView: StatsViewSwiftUI(tableForChart: tableForChart))
            vc.view.frame = CGRectMake(0, 0, 350, 450);
            view.addSubview(vc.view)
        }//implements a hosting view controller to display the chart made in SwiftUI
    }
    

    func PrepareRecordsForChart(records:[WordleRecord]) -> [ValuePerCategory] {
        
        var data: [ValuePerCategory] = [
            .init(category: "1", value: 0),
            .init(category: "2", value: 0),
            .init(category: "3", value: 0),
            .init(category: "4", value: 0),
            .init(category: "5", value: 0),
            .init(category: "6", value: 0),
            .init(category: "Loss", value: 0),
        ]
        
        for record in records {
            data[Int(record.numOfAttempts) - 1].value += 1
        }
        
        return data
    }/*converts the array of save records into an array of x,y coordinates that can be
      fed into a chart (x-no. of attempts, y-no. of games) */

}
