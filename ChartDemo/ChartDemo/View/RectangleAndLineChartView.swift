//
//  RectangleAndLineChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts

// 마크 타입 결합
//  동일한 데이터를 동일한 차트 내에서 여러 가지 방식으로 표시(선과 막대그래프)
struct RectangleAndLineChartView: View {
    var body: some View {

        Text("RectangleAndLineChart")
            .font(.title)
        Chart(tempData) { data in
            RectangleMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degress)
            )

            LineMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degress)
            )
        }
    }
}
