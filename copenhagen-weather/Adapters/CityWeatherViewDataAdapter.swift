//
//  CityWeatherViewDataAdapter.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import Foundation

struct CityWeatherViewDataAdapter {
    static func adapt(_ model: CityForecast) -> CityWeatherViewData {
        let today = model.dailyForecasts.first(where: { $0.date.isSameDay(model.date) })
        let maxTemperature: String = today?.maxTemperature.asDegrees() ?? "--"
        let minTemperature: String = today?.minTemperature.asDegrees() ?? "--"
        let forecast = model
            .dailyForecasts
            .map {
            CityWeatherViewData.DailyWeather(
                date: $0.date.formatted(),
                averageTemperature: $0.averageTemperature.asDegrees(),
                maxTemperature: $0.maxTemperature.asDegrees(),
                minTemperature: $0.minTemperature.asDegrees()
            )
        }
        
        return .init(name: model.city,
                     date: model.date.formatted(),
                     currentTemperature: model.temperature.asDegrees(),
                     maxTemperature: maxTemperature,
                     minTemperature: minTemperature,
                     condition: today?.condition?.capitalized ?? "--",
                     forecast: forecast)
    }
}
