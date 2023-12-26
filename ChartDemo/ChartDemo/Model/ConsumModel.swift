//
//  ConsumModel.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/26.
//

import Foundation
//12월 소비패턴
struct ConsumInfo: Identifiable {
    var id = UUID()
    var type: String
    var total: Int
    
}
var cunsumInfo: [ConsumInfo] = [
    .init(type: "쇼핑", total: 419610),
    .init(type: "주거,통신", total: 141860),
    .init(type: "이체", total: 128350),
    .init(type: "카테고리 없음", total: 120000),
]
