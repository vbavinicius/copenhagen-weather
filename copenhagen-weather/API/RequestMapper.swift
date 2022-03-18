//
//  RequestMapper.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import Foundation

protocol RequestMapperProtocol {
    func createRequest(for route: APIRoute) -> URLRequest?
}

struct RequestMapper: RequestMapperProtocol {
    let apiInfo = APIInfoLoader.load()
    
    func createRequest(for route: APIRoute) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = apiInfo.host
        urlComponents.path = route.path
        urlComponents.queryItems = route.queryItens
        urlComponents.queryItems?.append(.init(name: "appId", value: apiInfo.apiKey))
        
        guard let url = urlComponents.url else { return nil }
        return URLRequest(url: url)
    }
}
