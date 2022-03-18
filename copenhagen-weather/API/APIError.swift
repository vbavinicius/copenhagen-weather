//
//  APIError.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

enum APIError: Error {
    case notConnectedToInternet
    case invalidData
    case generic
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notConnectedToInternet:
            return "It looks like you are offline"
        case .invalidData, .generic:
            return "Hey, something went wrong"
        }
    }
}
