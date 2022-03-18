//
//  ViewState.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import Foundation

enum ViewState {
    case loading, loaded(CityWeatherViewData), error(String?)
}

extension ViewState: Equatable {
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch(lhs, rhs) {
        case (.loading, .loading), (.error, .error):
            return true
        case let (.loaded(lhsViewData), .loaded(rhsViewData)):
            return lhsViewData == rhsViewData
        default:
            return false
        }
    }
}
