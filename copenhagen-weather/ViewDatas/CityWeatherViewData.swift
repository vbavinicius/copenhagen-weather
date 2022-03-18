//
//  CityWeatherViewData.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import Foundation

struct CityWeatherViewData: Equatable {
    let name: String
    let date: String
    let currentTemperature: String
    let maxTemperature: String
    let minTemperature: String
    let condition: String
    let forecast: [DailyWeather]
    
    struct DailyWeather: Equatable {
        let date: String
        let averageTemperature: String
        let maxTemperature: String
        let minTemperature: String
    }
}

