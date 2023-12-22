//
//  StyleBarChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts

// .foregroundStyle 막대에 대해 서로 다른 색상을 표시
// .annotation 각 막대에 주석을 추가
struct StyleBarChartView: View {
    var body: some View {
        
        Text("StyleBarChart")
            .font(.title)
        Chart(tempData.filter{$0.year == "2021"}) { data in
            BarMark (
                x: .value("Month", data.month),
                y: .value("Temp", data.degrees)
            )
            .foregroundStyle(by: .value("Month", data.month))
            .annotation {
                Text("\(data.degrees)")
                    .foregroundStyle(.brown)
            }

        }
        
        // 가로 막대 차트를 만들려면 뷰의 x와 y를 교체(바꿔줌)
        Chart(tempData.filter{$0.year == "2021"}) { data in
            BarMark (
                x: .value("Temp", data.degrees),
                y: .value("Month", data.month)
            )
            .foregroundStyle(by: .value("Month", data.month))
            .annotation {
                Text("\(data.degrees)")
                    .foregroundStyle(.brown)
            }
        }

    }
}

#Preview {
    StyleBarChartView()
}
