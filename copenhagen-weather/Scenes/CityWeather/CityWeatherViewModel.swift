//
//  CityWeatherViewModel.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation
import Combine

protocol CityWeatherViewModelDelegate: AnyObject {
    func viewModelDidChangedState(to state: ViewState)
}

class CityWeatherViewModel {
    let service: CityWeatherServiceProtocol
    weak var delegate: CityWeatherViewModelDelegate?
    
    init(service: CityWeatherServiceProtocol = CityWeatherService()) {
        self.service = service
    }
    
    func load() {
        delegate?.viewModelDidChangedState(to: .loading)
        service.getWeather(for: .copenhagen) { [weak self] result in
            let state: ViewState
            switch result {
            case .success(let response):
                let viewData = CityWeatherViewDataAdapter.adapt(response)
                state = .loaded(viewData)
            case .failure(let error):
                state = .error(error.errorDescription)
            }
            self?.delegate?.viewModelDidChangedState(to: state)
        }
    }
}
