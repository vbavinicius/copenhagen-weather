//
//  CityWeatherServiceMock.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import XCTest
@testable import copenhagen_weather

class CityWeatherServiceMock: CityWeatherServiceProtocol {
    public var getWeatherCallsCount = 0
    public var result: (Result<CityForecast, APIError>)?
    
    func getWeather(for city: City, completion: @escaping (Result<CityForecast, APIError>) -> Void) {
        getWeatherCallsCount += 1
        guard let result = result else {
            XCTFail("Expected mocked result")
            return
        }
        completion(result)
    }
}
