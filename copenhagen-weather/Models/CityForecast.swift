//
//  CityForecast.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation

typealias Temperature = Double

struct CityForecast {
    let city: String
    let date: Date
    let temperature: Temperature
    let dailyForecasts: [DailyForecast]
    
    struct DailyForecast {
        let date: Date
        let condition: String?
        let averageTemperature: Temperature
        let maxTemperature: Temperature
        let minTemperature: Temperature
    }
}
