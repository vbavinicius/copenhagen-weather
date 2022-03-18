//
//  URLSessionDataTaskMock.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation
@testable import copenhagen_weather

class URLSessionMock: URLSessionProtocol {
    
    var data: Data? = nil
    var error: Error? = nil
    var urlResponse: URLResponse? = nil
    
    @discardableResult
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(data, urlResponse, error)
        return URLSessionDataTaskMock()
    }
}


class URLSessionDataTaskMock: URLSessionDataTask {
    override init() {}
    override func resume() {}
}
