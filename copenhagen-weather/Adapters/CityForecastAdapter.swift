//
//  CityForecastAdapter.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation

struct CityForecastAdapter {
    static func adapt(city: City,
                      response: ForecastOneCallResponse
    ) -> CityForecast {
        let date = Date(timeIntervalSince1970: response.currentTimeIntervalSince1970)
        let temperature = response.currentTemperature
        let dailyForecast = response.dailyForecast.map {
            CityForecast.DailyForecast(
                date: Date(timeIntervalSince1970: $0.timeIntervalSince1970),
                condition: $0.weatherDescriptions.first?.description,
                averageTemperature: $0.weatherData.day,
                maxTemperature: $0.weatherData.max,
                minTemperature: $0.weatherData.min
            )
        }.prefix(5)
        
        return .init(
            city: city.name,
            date: date,
            temperature: temperature,
            dailyForecasts: Array(dailyForecast)
        )
    }
}
