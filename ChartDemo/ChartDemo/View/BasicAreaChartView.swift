//
//  BasicAreaChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts

struct BasicAreaChartView: View {
    var body: some View {
        Text("AreaMarkChart")
            .font(.title)
            .padding()
        Chart {
            AreaMark(
                x: PlottableValue.value("Month", "Jun"),
                y: PlottableValue.value("Temp", 50)
            )

            // PlottableValue 생략 가능
            AreaMark(
                x: .value("Month", "Feb"),
                y: .value("Temp", 43)
            )

            AreaMark(
                x: .value("Month", "Mar"),
                y: .value("Temp", 61)
            )

        }
    }
}
