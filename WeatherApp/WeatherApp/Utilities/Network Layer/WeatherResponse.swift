//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation

/// Ответ API с информацией о погоде, текущими условиями и прогнозом.
struct WeatherResponse: Decodable {
    /// Информация о местоположении.
    let location: Location
    /// Текущие погодные условия.
    let current: CurrentWeather
    /// Прогноз погоды на несколько дней.
    let forecast: Forecast
}

/// Название города.
struct Location: Decodable {
    let name: String
}

/// Текущие погодные условия.
struct CurrentWeather: Decodable {
    /// Температура в градусах Цельсия.
    let tempC: Double
    /// Описание погодного состояния.
    let condition: WeatherCondition
    /// Скорость ветра в км/ч.
    let windKph: Double
    /// Влажность в процентах.
    let humidity: Int
}

/// Прогноз погоды на несколько дней.
struct Forecast: Decodable {
    /// Массив прогнозов по дням.
    let forecastday: [ForecastDay]
}

/// Прогноз погоды на конкретный день.
struct ForecastDay: Decodable {
    /// Данные о погоде на день.
    let day: DayWeather
}

/// Данные о максимальной и минимальной температуре.
struct DayWeather: Decodable {
    /// Максимальная температура в градусах Цельсия.
    let maxtempC: Double
    /// Минимальная температура в градусах Цельсия.
    let mintempC: Double
}

/// Описание погодных условий.
struct WeatherCondition: Decodable {
    /// Текстовое описание состояния погоды.
    let text: String
}
