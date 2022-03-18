//
//  APIErrorMapperTests.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import XCTest
@testable import copenhagen_weather

class APIErrorMapperTests: XCTestCase {
    
    var sut: APIErrorMapper!
    
    override func setUp() {
        sut = APIErrorMapper()
    }

    override func tearDown() {
        sut = nil
    }

    func test_APIErrorMapper_ReturnsError_WhenReceivedError() {
        let expectedError = APIError.generic
        let result = sut.mapError(data: Mock.mockData, response: nil, error: expectedError)
        switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, expectedError)
        }
    }
    
    
    func test_APIErrorMapper_ReturnsError_WhenReceivesNoData() {
        let expectedError = APIError.generic
        let result = sut.mapError(data: nil, response: Mock.mock200Response, error: nil)
        switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, expectedError)
        }
    }
    
    
    func test_APIErrorMapper_ReturnsError_WhenReceivesNoHTTPResponse() {
        let expectedError = APIError.generic
        let result = sut.mapError(data: Mock.mockData, response: nil, error: nil)
        switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, expectedError)
        }
    }
    
    
    func test_APIErrorMapper_ReturnsError_WhenReceivesNonValidStatusCode() {
        let expectedError = APIError.generic
        let result = sut.mapError(data: Mock.mockData, response: Mock.mock500Response, error: nil)
        switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, expectedError)
        }
    }
    
    
    func test_APIErrorMapper_ReturnsSuccessData_WhenReceivesValidData() {
        let result = sut.mapError(data: Mock.mockData, response: Mock.mock200Response, error: nil)
        switch result {
            case .success(let data):
                XCTAssertEqual(data, Mock.mockData)
            case .failure:
                XCTFail()
        }
    }
    
}
