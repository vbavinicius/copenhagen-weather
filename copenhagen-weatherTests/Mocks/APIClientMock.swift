//
//  APIClientMock.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import XCTest
@testable import copenhagen_weather

class APIClientMock: APIClientProtocol {
    public var requestCallsCount = 0
    public var result: (Result<Data, APIError>)?

    func request(_ route: APIRoute, returnQueue: DispatchQueue?, completion: @escaping (Result<Data, APIError>) -> Void) {
        requestCallsCount += 1
        guard let result = result else {
            XCTFail("Expected mocked result")
            return
        }
        completion(result)
    }
}
