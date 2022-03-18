//
//  CityWeatherService.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

protocol CityWeatherServiceProtocol {
    func getWeather(for city: City, completion: @escaping (Result<CityForecast, APIError>) -> Void)
}

struct CityWeatherService: CityWeatherServiceProtocol {
    let client: APIClientProtocol
    
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func getWeather(for city: City, completion: @escaping (Result<CityForecast, APIError>) -> Void) {
        let route = CityWeatherRoute(city: city)
        client.request(route, returnQueue: .main) { result in
            switch result {
            case .success(let data):
                do {
                    let forecastAPIResponse = try JSONDecoder().decode(ForecastOneCallResponse.self, from: data)
                    let cityForecast = CityForecastAdapter.adapt(city: city, response: forecastAPIResponse)
                    completion(.success(cityForecast))
                } catch {
                    completion(.failure(APIError.invalidData))
                }
            case .failure(let apiError):
                 completion(.failure(apiError))
            }
        }
    }
}
