//
//  URLSession+Protocols.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

public protocol URLSessionProtocol {
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
