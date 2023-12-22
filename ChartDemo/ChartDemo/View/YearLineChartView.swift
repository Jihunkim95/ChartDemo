//
//  YearLineChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts

// 데이터 필터링 그래프
// .foregroundStyle 연도별로 데이터를 구분한 그래프(서로 다른 색상으로 표시)
// .symbol 마크 포인트에 기호를 추가
//   데이터 카테고리에 따라 서로 다른 기호를 사용하여 구별
// .chartPlotStyle 차트 배경 등의 속성을 변경
// .interpolationMethod 데이터 포인트를 연결하기 위해 선을 그리는 방법
struct YearLineChartView: View {
    var body: some View {

        Text("YearLineChartView")
            .font(.title)
        Chart(tempData) { data in
            LineMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degrees)
            )
            .interpolationMethod(.stepStart)
            .foregroundStyle(by: .value("Year", data.year))
            .symbol(by: .value("Year", data.year))
        }
        .chartPlotStyle { plotArea in
            plotArea
                .background(.gray.opacity(0.1))
        }
    }
}


#Preview {
    YearLineChartView()
}
