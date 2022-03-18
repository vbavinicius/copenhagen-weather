//
//  CityWeatherRoute.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation

struct CityWeatherRoute: APIRoute {
    private let city: City
    var path: String { "/data/2.5/onecall" }
    var method: HTTPMethod { .get }
    var queryItens: [URLQueryItem] {
        [
            .init(name: "lat", value: "\(city.coordinate.latitude)"),
            .init(name: "lon", value: "\(city.coordinate.longitude)"),
            .init(name: "exclude", value: "minutely,hourly,alerts"),
            .init(name: "units", value: "metric"),
        ]
    }
    
    init(city: City) {
        self.city = city
    }
}
