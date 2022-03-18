//
//  APIErrorMapper.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

protocol APIErrorMapperProtocol {
    func mapError(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, APIError>
}

struct APIErrorMapper: APIErrorMapperProtocol {

    public func mapError(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, APIError> {

        if let error = error {
           if let urlError = error as? URLError, urlError.code.rawValue == URLError.Code.notConnectedToInternet.rawValue {
                return .failure(APIError.notConnectedToInternet)
            } else {
                return .failure(APIError.generic)
            }
        }
        
        guard let data = data else  {
            return .failure(APIError.generic)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else  {
            return .failure(APIError.generic)
        }
        
        guard (200..<400).contains(httpResponse.statusCode) else  {
            print(httpResponse.statusCode)
            return .failure(APIError.generic)
        }
    
        return .success(data)
    }
}
