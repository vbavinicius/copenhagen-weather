//
//  Mocks.swift
//  copenhagen-weatherTests
//
//  Created by Vinícius Barcelos on 16/03/22.
//

import Foundation

enum Mock {}

extension Mock {
    static let mockURL = URL(string: "https://api.openweathermap.org")!
    static let mock200Response = HTTPURLResponse(url: Mock.mockURL, statusCode: 200, httpVersion: nil, headerFields: [:])
    static let mock500Response = HTTPURLResponse(url: Mock.mockURL, statusCode: 500, httpVersion: nil, headerFields: [:])
    static let mockData = "mockdata".data(using: .utf8)
    
    static let invalidData: Data = "".data(using: .utf8)!
    static let validData: Data =
    """
    {
        "lat": 55.6759,
        "lon": 12.5655,
        "timezone": "Europe/Copenhagen",
        "timezone_offset": 3600,
        "current": {
            "dt": 1647450749,
            "sunrise": 1647408179,
            "sunset": 1647450838,
            "temp": 2.5,
            "feels_like": -0.95,
            "pressure": 1031,
            "humidity": 93,
            "dew_point": 1.48,
            "uvi": 0,
            "clouds": 100,
            "visibility": 4000,
            "wind_speed": 3.6,
            "wind_deg": 200,
            "weather": [
                {
                    "id": 701,
                    "main": "Mist",
                    "description": "mist",
                    "icon": "50d"
                }
            ]
        },
        "daily": [
            {
                "dt": 1647428400,
                "sunrise": 1647408179,
                "sunset": 1647450838,
                "moonrise": 1647441780,
                "moonset": 1647408600,
                "moon_phase": 0.44,
                "temp": {
                    "day": 6.65,
                    "min": 2.5,
                    "max": 7.1,
                    "night": 4.26,
                    "eve": 2.5,
                    "morn": 3.06
                },
                "feels_like": {
                    "day": 5.88,
                    "night": 0.29,
                    "eve": -0.67,
                    "morn": 1.21
                },
                "pressure": 1031,
                "humidity": 62,
                "dew_point": -0.42,
                "wind_speed": 5.26,
                "wind_deg": 122,
                "wind_gust": 10.19,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 3,
                "pop": 0,
                "uvi": 2.15
            },
            {
                "dt": 1647514800,
                "sunrise": 1647494422,
                "sunset": 1647537359,
                "moonrise": 1647533220,
                "moonset": 1647495720,
                "moon_phase": 0.47,
                "temp": {
                    "day": 6.63,
                    "min": 3.58,
                    "max": 7.36,
                    "night": 5.82,
                    "eve": 6.57,
                    "morn": 3.67
                },
                "feels_like": {
                    "day": 2,
                    "night": 2.72,
                    "eve": 3.48,
                    "morn": -1.48
                },
                "pressure": 1028,
                "humidity": 76,
                "dew_point": 2.63,
                "wind_speed": 9.04,
                "wind_deg": 147,
                "wind_gust": 15.77,
                "weather": [
                    {
                        "id": 501,
                        "main": "Rain",
                        "description": "moderate rain",
                        "icon": "10d"
                    }
                ],
                "clouds": 99,
                "pop": 1,
                "rain": 2.71,
                "uvi": 1.76
            },
            {
                "dt": 1647601200,
                "sunrise": 1647580665,
                "sunset": 1647623880,
                "moonrise": 1647624660,
                "moonset": 1647582660,
                "moon_phase": 0.5,
                "temp": {
                    "day": 8.33,
                    "min": 3.39,
                    "max": 8.86,
                    "night": 4.5,
                    "eve": 6.93,
                    "morn": 3.39
                },
                "feels_like": {
                    "day": 6.47,
                    "night": 1.59,
                    "eve": 4.14,
                    "morn": 1.59
                },
                "pressure": 1042,
                "humidity": 72,
                "dew_point": 3.42,
                "wind_speed": 5.03,
                "wind_deg": 335,
                "wind_gust": 7.54,
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": 54,
                "pop": 0,
                "uvi": 1.99
            },
            {
                "dt": 1647687600,
                "sunrise": 1647666908,
                "sunset": 1647710400,
                "moonrise": 1647716280,
                "moonset": 1647669600,
                "moon_phase": 0.54,
                "temp": {
                    "day": 8.44,
                    "min": 3.13,
                    "max": 8.48,
                    "night": 4.72,
                    "eve": 6.21,
                    "morn": 3.13
                },
                "feels_like": {
                    "day": 7.07,
                    "night": 2.13,
                    "eve": 3.76,
                    "morn": 0.08
                },
                "pressure": 1049,
                "humidity": 49,
                "dew_point": -2.21,
                "wind_speed": 3.8,
                "wind_deg": 348,
                "wind_gust": 7.14,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 2.03
            },
            {
                "dt": 1647774000,
                "sunrise": 1647753150,
                "sunset": 1647796921,
                "moonrise": 1647808020,
                "moonset": 1647756600,
                "moon_phase": 0.58,
                "temp": {
                    "day": 6.85,
                    "min": 3.02,
                    "max": 6.85,
                    "night": 4.13,
                    "eve": 5.09,
                    "morn": 3.02
                },
                "feels_like": {
                    "day": 3.95,
                    "night": 0.66,
                    "eve": 1.86,
                    "morn": -0.24
                },
                "pressure": 1045,
                "humidity": 51,
                "dew_point": -2.9,
                "wind_speed": 4.64,
                "wind_deg": 141,
                "wind_gust": 7.85,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 2.24
            },
            {
                "dt": 1647860400,
                "sunrise": 1647839393,
                "sunset": 1647883441,
                "moonrise": 1647899880,
                "moonset": 1647843660,
                "moon_phase": 0.61,
                "temp": {
                    "day": 7.13,
                    "min": 3.33,
                    "max": 7.13,
                    "night": 4.26,
                    "eve": 5.56,
                    "morn": 3.33
                },
                "feels_like": {
                    "day": 4.02,
                    "night": 0.83,
                    "eve": 2.42,
                    "morn": -0.33
                },
                "pressure": 1039,
                "humidity": 50,
                "dew_point": -3.18,
                "wind_speed": 4.95,
                "wind_deg": 137,
                "wind_gust": 8.06,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 3
            },
            {
                "dt": 1647946800,
                "sunrise": 1647925635,
                "sunset": 1647969961,
                "moonrise": 0,
                "moonset": 1647930900,
                "moon_phase": 0.65,
                "temp": {
                    "day": 8.38,
                    "min": 3.23,
                    "max": 8.46,
                    "night": 5.2,
                    "eve": 6.66,
                    "morn": 3.23
                },
                "feels_like": {
                    "day": 5.92,
                    "night": 2.37,
                    "eve": 3.9,
                    "morn": -0.25
                },
                "pressure": 1037,
                "humidity": 57,
                "dew_point": -0.08,
                "wind_speed": 4.24,
                "wind_deg": 112,
                "wind_gust": 7.08,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 3
            },
            {
                "dt": 1648033200,
                "sunrise": 1648011877,
                "sunset": 1648056481,
                "moonrise": 1647991920,
                "moonset": 1648018500,
                "moon_phase": 0.69,
                "temp": {
                    "day": 8.79,
                    "min": 4.15,
                    "max": 8.79,
                    "night": 5.53,
                    "eve": 6.52,
                    "morn": 4.17
                },
                "feels_like": {
                    "day": 6.73,
                    "night": 3.6,
                    "eve": 4.4,
                    "morn": 1.4
                },
                "pressure": 1038,
                "humidity": 55,
                "dew_point": -0.29,
                "wind_speed": 3.58,
                "wind_deg": 151,
                "wind_gust": 5.59,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 3
            }
        ]
    }
    """.data(using: .utf8)!
}
