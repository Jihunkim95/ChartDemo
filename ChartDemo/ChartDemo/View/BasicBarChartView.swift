//
//  BasicBarChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts

struct BasicBarChartView: View {
    var body: some View {
        Text("DataBarChart")
            .font(.title)
            .padding()
        Chart {
            BarMark(
                x: .value("Month", "Jun"),
                y: .value("Temp", 50)
            )

            BarMark(
                x: .value("Month", "Feb"),
                y: .value("Temp", 43)
            )

            BarMark(
                x: .value("Month", "Mar"),
                y: .value("Temp", 61)
            )

        }
    }
}
