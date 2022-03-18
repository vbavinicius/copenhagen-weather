//
//  CityWeatherViewModelTests.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import XCTest
@testable import copenhagen_weather

class CityWeatherViewModelTests: XCTestCase {

    private lazy var serviceMock = CityWeatherServiceMock()
    private lazy var delegateSpy = CityWeatherViewModelDelegateSpy()
    private lazy var sut: CityWeatherViewModel = {
        let sut = CityWeatherViewModel(service: serviceMock)
        sut.delegate = delegateSpy
        return sut
    }()

    func testLoad_GetWeatherSuccess_StateShouldLoaded() {
        let data = CityForecast.init(
            city: "",
            date: Date(),
            temperature: 0,
            dailyForecasts: []
        )
        let adaptedData = CityWeatherViewDataAdapter.adapt(data)
        
        serviceMock.result = .success(data)
        sut.load()

        XCTAssertEqual(delegateSpy.viewModelDidChangedStateCallsCount, 2)
        XCTAssertEqual(delegateSpy.viewModelDidChangedStateCallsCountInvocations, [.loading, .loaded(adaptedData)])
    }
    
    func testLoad_GetWeatherFails_StateShouldError() {
        serviceMock.result = .failure(.generic)
        sut.load()

        XCTAssertEqual(delegateSpy.viewModelDidChangedStateCallsCount, 2)
        XCTAssertEqual(delegateSpy.viewModelDidChangedStateCallsCountInvocations, [.loading, .error(APIError.generic.errorDescription)])
    }
}

