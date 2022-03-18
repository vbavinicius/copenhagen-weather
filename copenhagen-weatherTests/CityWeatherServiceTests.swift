//
//  CityWeatherService.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import XCTest
@testable import copenhagen_weather

class CityWeatherServiceTests: XCTestCase {
    
    private lazy var apiClient = APIClientMock()
    private lazy var sut = CityWeatherService(client: apiClient)
    
    func testGetWeather_WhenReceivesErrorFromAPI_ShouldFail() {
        apiClient.result = .failure(.generic)
        
        let exp = expectation(description: "wait")
        sut.getWeather(for: .copenhagen) { result in
            exp.fulfill()
            switch result {
            case .success:
                XCTFail()
            case .failure:
                break
            }
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(apiClient.requestCallsCount, 1)
    }
    
    func testGetWeather_WhenReceivesValidDataFromAPI_ShouldSucceeds() {
        apiClient.result = .success(Mock.validData)
        
        let exp = expectation(description: "wait")
        sut.getWeather(for: .copenhagen) { result in
            exp.fulfill()
            switch result {
            case .success:
                break
            case .failure:
                XCTFail()
            }
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(apiClient.requestCallsCount, 1)
    }
    
    func testGetWeather_WhenReceivesInvalidDataFromAPI_ShouldSucceeds() {
        apiClient.result = .success(Mock.invalidData)
        
        let exp = expectation(description: "wait")
        sut.getWeather(for: .copenhagen) { result in
            exp.fulfill()
            switch result {
            case .success:
                XCTFail()
            case .failure:
                break
            }
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(apiClient.requestCallsCount, 1)
    }
}
