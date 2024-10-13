//
//  Request.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 13.10.2024.
//

import Foundation

class Request {

    func fetchData(city: Cities.RawValue) async -> WeatherResponse {
        let url = URL(
            string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d2940a6a7734ff5d485485e6a5adffbc&units=metric&lang=ru"
        )!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
            } catch {
                return
            }
        }
        .resume()
    }
}
