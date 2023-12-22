//
//  MonthlyTemp.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import Foundation

struct MonthlyTemp: Identifiable {
    var id = UUID()
    var month: String
    var degress: Int
}

let tempData: [MonthlyTemp] = [
    MonthlyTemp(month: "Jun", degress: 50),
    MonthlyTemp(month: "Feb", degress: 43),
    MonthlyTemp(month: "Mar", degress: 63)
]
