//
//  Request.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 13.10.2024.
//

import Foundation

/// Сетевой сервис для выполнения HTTP-запросов и декодирования данных.
class NetworkService {
    /// Дженерик метод который выполняет HTTP-запрос и декодирует ответ в указанный тип данных.
    func fetchData<T: Decodable>(
        url: String,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = URL(
            string: url
        )!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try jsonDecoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }

        .resume()
    }
}
