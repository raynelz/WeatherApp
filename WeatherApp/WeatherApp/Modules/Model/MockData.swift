//
//  MockData.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation

struct MockData {
    static let mockData: [WeatherData] = [
        .init(city: "Москва", currentTemperature: 28, maxTemperature: 32, minTemperature: 18, description: "Солнечно и ясно", windSpeed: 10, humidity: 54),
        .init(city: "Питер", currentTemperature: 16, maxTemperature: 18, minTemperature: 10, description: "Небольшой дождь", windSpeed: 7, humidity: 68)
    ]
    
    
    static let mockWeatherResponse = WeatherResponse(
        weather: [
            Weather(description: "ясно")
        ],
        main: MainWeather(
            temp: 20.5,
            tempMin: 18.3,
            tempMax: 22.7,
            humidity: 60.0
        ),
        wind: WindWeather(
            speed: 5.4
        ),
        name: "Москва"
    )

}
