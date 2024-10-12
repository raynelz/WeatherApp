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

struct HumidityData: MeteorologicalDataProtocol {
    let text = UILabel()
    let value = UILabel()
    let symbol = UIImageView(image: UIImage(named: "humidity"))
}

struct WindData: MeteorologicalDataProtocol {
    let text = UILabel()
    let value = UILabel()
    let symbol = UIImageView(image: UIImage(named: "wind"))
}
