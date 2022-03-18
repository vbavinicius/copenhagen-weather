//
//  Date+Extensions.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 17/03/22.
//

import Foundation

extension Date {
    func formatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self).uppercased()
    }
    
    func isSameDay(_ date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}
