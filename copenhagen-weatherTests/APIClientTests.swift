//
//  APIClientTests.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import XCTest
@testable import copenhagen_weather

class APIClientTests: XCTestCase {

    var sut: APIClient!
    var session: URLSessionMock!
    
    override func setUp() {
        session = URLSessionMock()
        sut = APIClient(urlSession: session)
    }

    override func tearDown() {
        session.data = nil
        session.error = nil
        session.urlResponse = nil
        session = nil
        sut = nil
    }

    
    func test_RequestSucceeds_WhenDataTaskSucceeds() {
        session.data = Mock.mockData
        session.urlResponse = Mock.mock200Response
        let exp = expectation(description: "wait")
        sut.request(CityWeatherRoute.init(city: .copenhagen), returnQueue: .main) { result in
            exp.fulfill()
            switch result {
            case .success(let data):
                XCTAssertEqual(data, Mock.mockData)
            case .failure:
                XCTFail()
            }
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    
    func test_RequestFail_WhenDataTaskFails() {
        session.error = APIError.generic
        let exp = expectation(description: "wait")
        sut.request(CityWeatherRoute.init(city: .copenhagen), returnQueue: .main) { result in
            exp.fulfill()
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, APIError.generic)
            }
        }
        
        wait(for: [exp], timeout: 1)
    }
}
