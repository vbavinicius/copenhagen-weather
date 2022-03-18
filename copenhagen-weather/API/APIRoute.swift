//
//  APIRoute.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

public protocol APIRoute {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItens: [URLQueryItem] { get }
}

public enum HTTPMethod: String {
    case get = "GET"
}
