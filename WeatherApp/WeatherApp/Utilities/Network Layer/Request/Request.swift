//
//  Request.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 13.10.2024.
//

import Foundation

class NetworkService {
    
    func fetchData<T: Decodable>(
        url: String,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = URL(
            string: url
        )!
        
        URLSession.shared.dataTask(with: url) { data, resonse, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
