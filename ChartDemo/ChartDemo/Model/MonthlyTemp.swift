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
    var degrees: Int
    var year: String

}

let tempData: [MonthlyTemp] = [
    MonthlyTemp(month: "Jan", degrees: 50, year: "2021"),
    MonthlyTemp(month: "Feb", degrees: 43, year: "2021"),
    MonthlyTemp(month: "Mar", degrees: 61, year: "2021"),

    MonthlyTemp(month: "Jan", degrees: 30, year: "2022"),
    MonthlyTemp(month: "Feb", degrees: 38, year: "2022"),
    MonthlyTemp(month: "Mar", degrees: 29, year: "2022")
]
