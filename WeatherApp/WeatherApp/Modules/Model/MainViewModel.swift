//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation
import UIKit

protocol MeteorologicalDataProtocol {
    var text: UILabel { get }
    var value: UILabel { get }
    var symbol: UIImageView { get }
}

struct WeatherData {
    let city: String
    let currentTemperature: Int
    let maxTemperature: Int
    let minTemperature: Int
    let description: String
    let windSpeed: Int
    let humidity: Int
}

enum SFArrowDirection: String {
    case up = "arrow.up"
    case down = "arrow.down"
}

struct HumidityData: MeteorologicalDataProtocol {
    let text = UILabel()
    let value = UILabel()
    let symbol = UIImageView(image: UIImage(systemName: "humidity"))
}

struct WindData: MeteorologicalDataProtocol {
    let text = UILabel()
    let value = UILabel()
    let symbol = UIImageView(image: UIImage(systemName: "wind"))
}

enum Cities: String, CaseIterable {
    case moscow = "https://api.openweathermap.org/data/2.5/weather?q=Москва&appid=d2940a6a7734ff5d485485e6a5adffbc&units=metric&lang=ru"
    case saintPetersburg = "https://api.openweathermap.org/data/2.5/weather?q=Санкт-Петербург&appid=d2940a6a7734ff5d485485e6a5adffbc&units=metric&lang=ru"
    case orenburg = "https://api.openweathermap.org/data/2.5/weather?q=Оренбург&appid=d2940a6a7734ff5d485485e6a5adffbc&units=metric&lang=ru"
}
