//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation

/// Структура для хранения общего ответа с информацией о погоде.
struct WeatherResponse {
    /// Основная информация о погоде (температура, влажность).
    let main: MainWeather
    /// Информация о ветре.
    let wind: WindWeather
}

/// Структура для хранения основной информации о погоде.
struct MainWeather: Decodable {
    /// Текущая температура.
    let temp: Double
    /// Минимальная температура.
    let tempMin: Double
    /// Максимальная температура.
    let tempMax: Double
    /// Влажность воздуха.
    let humidity: Double
}

/// Структура для хранения данных о ветре.
struct WindWeather: Decodable {
    /// Скорость ветра.
    let speed: Double
}
