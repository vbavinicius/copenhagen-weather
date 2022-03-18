//
//  Double+Extensions.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import Foundation

extension Double {
    func asDegrees() -> String {
        "\(Int(self.rounded()))°"
    }
}
