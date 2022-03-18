//
//  CityWeatherViewModelDelegateSpy.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import XCTest
@testable import copenhagen_weather

class CityWeatherViewModelDelegateSpy: CityWeatherViewModelDelegate {
    public var viewModelDidChangedStateCallsCount = 0
    public var viewModelDidChangedStateCallsCountInvocations: [ViewState] = []
    
    func viewModelDidChangedState(to state: ViewState) {
        viewModelDidChangedStateCallsCount += 1
        viewModelDidChangedStateCallsCountInvocations.append(state)
    }
}
