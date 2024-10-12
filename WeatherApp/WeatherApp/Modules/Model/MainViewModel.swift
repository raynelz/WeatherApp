//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation

struct WeatherData {
    let currentTemperature: Double
    let maxTemperature: Double
    let minTemperature: Double
    let description: String
    let windSpeed: Double
    let humidity: Double
}

enum SFArrowDirection: String {
    case up = "arrow.up"
    case down = "arrow.down"
}
