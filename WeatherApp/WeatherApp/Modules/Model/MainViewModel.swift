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
    case moscow = "Москва"
    case saintPetersburg = "Санкт-Петербург"
    case orenburg = "Оренбург"
}
