//
//  ChartDemoView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI

import Charts

struct ChartDemoView: View {

    let sales = [
        (channel: "Retail", data: retailSales),
        (channel: "Online", data: onlineSales)
    ]

    var body: some View {
        Text("ChartDemoView")
            .font(.title)
        Chart {
            // Retail, Online 구분 판매 데이터
            ForEach(sales, id: \.channel) { channel in
                // 월별 판매 매출
                ForEach(channel.data) { sales in
                    BarMark(
                        x: .value("Month", sales.month),
                        y: .value("Total", sales.total)
                    )
                    // 판매 채널을 기반으로 데이터를 (구분)필터링하도록 구성
                    .foregroundStyle(by: .value("Channel", channel.channel))
                }
            }
        }
        .frame(height: 250)
        .padding()

    }
}

