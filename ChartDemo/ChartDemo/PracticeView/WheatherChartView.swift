//
//  WheatherChartView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import SwiftUI
import Charts


struct WheatherChartView: View {
    @ObservedObject var weatherAPI: WeatherAPI

    var body: some View {
        
        if weatherAPI.isLoading{
            ProgressView("로딩")
        }else{
            Spacer()
            Text("일별 평균기온")
                .font(.title2)
            Chart{
                // 백령도 데이터에 대한 LineMark
                ForEach(weatherAPI.posts.filter { $0.stnNm == "백령도" }, id: \.self) { data in
                    LineMark(
                        x: .value("날짜", data.tm),
                        y: .value("평균기온", Double(data.avgTs) ?? 0)
                    )
                    .interpolationMethod(.stepStart)
                    .foregroundStyle(by: .value("stnNm", data.stnNm))
                    .symbol(by: .value("stnNm", data.stnNm))
                    
                }

                // 서울 데이터에 대한 LineMark
                ForEach(weatherAPI.posts.filter { $0.stnNm == "서울" }, id: \.self) { data in
                    LineMark(
                        x: .value("날짜", data.tm),
                        y: .value("평균기온", Double(data.avgTs) ?? 0)
                    )
                    .interpolationMethod(.stepStart)
                    .foregroundStyle(by: .value("stnNm", data.stnNm)) // 서울 선 색상
                    .symbol(by: .value("stnNm", data.stnNm))

                }
                
            }
            .background(Color.orange.opacity(0.1)) // 배경 색상 설정
            .frame(maxWidth: .infinity, maxHeight: 300)
            .chartLegend(.visible) // 범례 표시
            .chartYAxis{
                AxisMarks(position: .leading)
            }//Y축 레이블 왼쪽
            
            Spacer()
        }
        
    }
}
