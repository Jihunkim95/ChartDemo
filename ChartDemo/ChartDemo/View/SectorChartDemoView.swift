//
//  SectorChartDemoView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/26.
//

import SwiftUI
import Charts
@available(iOS 17.0, *)
struct SectorChartDemoView: View {
    var body: some View {
        OneRankBarChartDemoView()
    }
}
@available(iOS 17.0, *)
// 1차원 막대 차트를 생성하려면 x 또는 y축 하나의 값만 제공
struct OneRankBarChartDemoView: View {

    let sales = [
        (channel: "Retail", data: retailSales),
        (channel: "Online", data: onlineSales)
    ]
    
        var body: some View {
            Text("SectorChartDemoView")
                .font(.title)
            Chart {
                ForEach(retailSales) { sales in
                    // 원형
                    //                SectorMark(
                    //                    angle: .value("Total", sales.total)
                    // 막대
                    BarMark(
    //                    x: .value("Month", sales.month),
                        x: .value("Total", sales.total)
                    )
                    .foregroundStyle(by: .value("Month", sales.month))
                }
            }
            .frame(height: 100)
            .padding()
        }
    

//    var body: some View {
//        Chart {
//            ForEach(retailSales) { sales in
//                
//                SectorMark(
//                    angle: .value("Total", sales.total)
//                )
//                .foregroundStyle(by: .value("Month", sales.month))
//            }
//        }
//        .frame(height: 500)
//        .padding()
//
//    }
}
//    var body: some View {
//        Text("SectorChartDemoView")
//            .font(.title)
//        Chart {
//            ForEach(retailSales) { sales in
//                BarMark(
////                    x: .value("Month", sales.month),
//                    x: .value("Total", sales.total)
//                )
//                .foregroundStyle(by: .value("Month", sales.month))
//            }
//        }
//        .frame(height: 100)
//        .padding()
//    }
//
