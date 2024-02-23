//
//  StatsView.swift
//  Wordle iOS
//
//  Created by Rehanga Gamage on 2024-02-22.
//

import SwiftUI
import Charts

struct StatsViewSwiftUI: View {
    @State var tableForChart: [ValuePerCategory]
    
    var body: some View {
        Text("STATS")
        Chart(tableForChart, id: \.category) { item in
            BarMark(
                x: .value("No. of Attempts", item.category),
                y: .value("No. of Games", item.value)
            )
        }
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text("Attempts")
        }
        .chartYAxisLabel {
            Text("Games")
        }
    }
}






/*
#Preview {
    StatsViewSwiftUI(tableForChart: <#[ValuePerCategory]#>)
}
 */
