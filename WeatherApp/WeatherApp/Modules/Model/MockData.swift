//
//  MockData.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation

struct MockData {
    static let mockData: [WeatherData] = [
        .init(currentTemperature: 28, maxTemperature: 32, minTemperature: 18, description: "Солнечно и ясно", windSpeed: 10, humidity: 54),
        .init(currentTemperature: 16, maxTemperature: 18, minTemperature: 10, description: "Небольшой дождь", windSpeed: 7, humidity: 68)
    ]
        
}
