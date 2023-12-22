/*
https://developer.apple.com/documentation/Charts
Chart : 모든 차트 구현체의 최상위 뷰

Mark 뷰 타입

AreaMark(영역) : 하나 이상의 지역의 면적을 사용하여 데이터를 나타내는 차트 콘텐츠
LineMark(선) : 일련의 연결된 선분을 사용하여 데이터를 나타내는 차트 콘텐츠
PointMark(점) : 포인트를 이용해 데이터를 표현하는 차트 콘텐츠
RectangleMark(직사각형) : 직사각형을 사용하여 데이터를 나타내는 차트 콘텐츠
RuleMark : 단일 가로 또는 세로 규칙을 사용하여 데이터를 나타내는 차트 콘텐츠
BarMark(막대) : 막대를 사용하여 데이터를 나타내는 차트 콘텐츠
각 마크는 x, y 값으로 초기화, 각 값은 PlottableValue 클래스의 인스턴스로 표현
*/

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        VStack{
            ScrollView{
                BasicAreaChartView()
                BasicBarChartView()
                DataAreaChartView()
                RectangleAndLineChartView()
                
                YearLineChartView()
                StyleBarChartView()
                
                ChartDemoView()
                
            }

        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
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

