//
//  DataAreaChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts

struct DataAreaChartView: View {

    var body: some View {
        Text("DataAreaChart") 
            .font(.title)
            .padding()
        Chart{
            ForEach(tempData){ data in
                AreaMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degrees)
                )
            }
        }
    }
}

#Preview {
    DataAreaChartView()
}
