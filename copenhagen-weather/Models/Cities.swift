//
//  Cities.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation

enum City {
    case copenhagen
    case calgary
    
    var coordinate: Coordinate {
        switch self {
        case .copenhagen:
            return .init(longitude: 12.5655, latitude: 55.6759)
        case .calgary:
            return .init(longitude: -114.066666, latitude: 51.049999)
        }
    }
    
    var name: String {
        switch self {
        case .copenhagen:
            return "Copenhagen"
        case .calgary:
            return "Calgary"
        }
    }
}

struct Coordinate {
    let longitude: Double
    let latitude: Double
}
