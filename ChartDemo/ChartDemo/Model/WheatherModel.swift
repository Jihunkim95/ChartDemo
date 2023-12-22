//
//  WheatherModel.swift
//  ChartDemo
//
//  Created by 김지훈 on 2023/12/22.
//

import Foundation

struct Response: Codable {
    let response: BodyContainer
}

struct BodyContainer: Codable {
    let body: Body
}

struct Body: Codable {
    let items: Items
}

struct Items: Codable {
    let item: [WeatherData]
}

struct WeatherData: Codable, Hashable {
    var id = UUID()
    let stnNm: String //지역
    let tm: String //날짜
    let avgTs: String // 평균지면온도
    private enum CodingKeys: String, CodingKey {
        case stnNm, tm, avgTs
    }
}


//싱글톤 패턴
class WeatherAPI: ObservableObject {
    static let shared = WeatherAPI()
    
    init() {}
    
    @Published var posts = [WeatherData]()
    @Published var isLoading = true //로딩상태
    //API 불러오는 테스트용 함수
    func weatherData(stnIds: Int) -> Void{
        //apiKey 불러오고
        guard let apiKey = apiKey else { return }
        //url선언
        let urlString = "http://apis.data.go.kr/1360000/AsosDalyInfoService/getWthrDataList?ServiceKey=\(apiKey)&dataType=JSON&dataCd=ASOS&dateCd=DAY&startDt=20230101&endDt=20230601&stnIds=\(stnIds)"
        
        guard let url = URL(string: urlString) else { return }
        
        _ = URLSession(configuration: .default)
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }

            do {
                let fullResponse = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.posts.append(contentsOf: fullResponse.response.body.items.item)
                    print(self.posts)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        //중단된 작업 재개
        task.resume()
    }
    //Secrets.xcconfig에서 선언한 API Key 받기
    private var apiKey: String?{
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'Info.plist'")
        }
        return apiKey
    }
}
