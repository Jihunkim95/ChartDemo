//
//  ConsumPatternView.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/26.
//

import SwiftUI
import Charts

// 막대형 차트를 원형 차트로 변형
struct ConsumPatternView: View {
    
    // 차트와 상호작용을 위한 프로퍼티
    @State private var selectedCount: Int?
    // 차트의 섹터를 선택
    @State private var selectedSector: String?
    
    var body: some View {
        VStack(alignment: .leading){

            Text("12월 소비")
                .font(.title)
                .underline()
                .padding()
            Text("\(cunsumInfo.reduce(0){(sum, info) in sum + info.total}) 원 ")
                .font(.title2)
                .padding()
            
            Chart {
                ForEach(cunsumInfo) { data in
                    // angle 매개변수 : x축 값을 지정하는 대신 해당 값을 매개 angle에 전달
                    // angularInset 매개변수 : 섹터 사이에 간격을 추가
                    // outerRadius 매개변수 : 조금 더 크게 만들어 강조 표시하려는 경우
                    // innerRadius 매개변수 : 도넛 차트로 변환
                    SectorMark(
                        angle: .value("Total", data.total),
                        innerRadius: .ratio(0.4),
                        outerRadius: selectedSector == data.type ? 170 : 150,
                        angularInset: 1.0
                    )
                    .foregroundStyle(by: .value("Type", data.type))
                    // 각 섹터에 대한 레이블을 추가
                    // 각 섹터에 텍스트 레블을 오버레이하여 표시
                    .annotation(position: .overlay) {
                    
                        Text("\(data.total)원")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(.white)
                            
                    }
                    // 섹터 모서리를 둥글게
                    .cornerRadius(5)
                    // 선택하지 않은 섹터에 투명도 처리
                    .opacity(selectedSector == nil ? 1.0 : (selectedSector == data.type ? 1.0 : 0.5))
                    
                }
            }
            .frame(height: 300)
            .padding()
            // 차트 배경에 뷰를 추가
            .chartBackground {_ in
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .offset(y: -6)
                    .foregroundStyle(Color(.green))
            }
            // 프로퍼티 바인딩을 전달하여 사용자의 터치를 포착
            .chartAngleSelection(value: $selectedCount)
            .onChange(of: selectedCount) { oldValue, newValue in
                // 캡처된 값은 사용자가 터치한 정확한 섹터를 직접 알려주진 않음
                // 선택한 섹터의 값을 제공
                if let newValue {
    //                print(newValue)
                    selectedSector = findSelectedSector(value: newValue)
                } else {
                    selectedSector = nil
                }
                
                print("\(selectedSector ?? "")")
                
            }
            
        }
        Spacer()

    }
}

// 선택한 값을 가져와 해당 섹터의 이름을 반환하는 함수
private func findSelectedSector(value: Int) -> String? {
    var count = 0
    let info = cunsumInfo.first { data in
        count += data.total
        return value <= count
    }
    
    return info?.type
}


