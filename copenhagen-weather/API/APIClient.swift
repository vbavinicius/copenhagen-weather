//
//  APIClient.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

protocol APIClientProtocol {
    func request(_ route: APIRoute, returnQueue: DispatchQueue?, completion: @escaping (Result<Data, APIError>) -> Void)
}

public struct APIClient: APIClientProtocol {
        
    private let urlSession: URLSessionProtocol
    private let requestMapper: RequestMapperProtocol
    private let apiErrorMapper: APIErrorMapperProtocol

    init(
        urlSession: URLSessionProtocol = URLSession.shared,
        requestMapper: RequestMapperProtocol = RequestMapper(),
        apiErrorMapper: APIErrorMapperProtocol = APIErrorMapper()
    ) {
        self.requestMapper = requestMapper
        self.apiErrorMapper = apiErrorMapper
        self.urlSession = urlSession
    }

    func request(_ route: APIRoute, returnQueue: DispatchQueue?, completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let request = self.requestMapper.createRequest(for: route) else {
            returnQueue?.async {
                completion(.failure(APIError.generic))
            }
            return
        }
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            let mappedResult = self.apiErrorMapper.mapError(data: data, response: response, error: error)
            returnQueue?.async {
                completion(mappedResult)
            }
        }
        dataTask.resume()
    }
}
