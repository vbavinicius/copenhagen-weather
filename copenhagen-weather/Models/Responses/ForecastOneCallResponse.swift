//
//  ForecastOneCallResponse.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation

struct ForecastOneCallResponse: Decodable {
    let currentTemperature: Double
    let currentTimeIntervalSince1970: Double
    let dailyForecast: [ForecastResponse]
    
    enum CodingKeys: String, CodingKey {
        case current, daily
    }
    
    enum CurrentCodingKeys: String, CodingKey {
        case temp, dt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let currentContainer = try container.nestedContainer(keyedBy: CurrentCodingKeys.self, forKey: .current)
        currentTemperature = try currentContainer.decode(Double.self, forKey: .temp)
        currentTimeIntervalSince1970 = try currentContainer.decode(Double.self, forKey: .dt)
        dailyForecast  = try container.decode([ForecastResponse].self, forKey: .daily)
    }
    
    struct ForecastResponse: Decodable {
        let timeIntervalSince1970: TimeInterval
        let weatherData: DailyWeather
        let weatherDescriptions: [WeatherDescription]
        
        enum CodingKeys: String, CodingKey {
            case weatherData = "temp"
            case timeIntervalSince1970 = "dt"
            case weatherDescriptions = "weather"
        }
        
        struct DailyWeather: Decodable {
            let day: Double
            let min: Double
            let max: Double
        }
        
        struct WeatherDescription: Decodable {
            let description: String
        }
    }
}
