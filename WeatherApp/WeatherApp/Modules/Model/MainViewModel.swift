//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 11.10.2024.
//

import Foundation
import UIKit

/// Протокол для описания метеорологических данных с текстом, значением и символом.
protocol MeteorologicalDataProtocol {
    /// Текстовое описание параметра.
    var text: UILabel { get }
    
    /// Значение параметра.
    var value: UILabel { get }
    
    /// Символ, представляющий параметр.
    var symbol: UIImageView { get }
}

/// Перечисление направлений стрелок для отображения тренда.
enum SFArrowDirection: String {
    /// Стрелка вверх.
    case up = "arrow.up"
    
    /// Стрелка вниз.
    case down = "arrow.down"
}

/// Данные о влажности, реализующие протокол `MeteorologicalDataProtocol`.
struct HumidityData: MeteorologicalDataProtocol {
    /// Метка для описания влажности.
    let text = UILabel()
    
    /// Значение влажности.
    let value = UILabel()
    
    /// Символ влажности.
    let symbol = UIImageView(image: UIImage(systemName: "humidity"))
}

/// Данные о ветре, реализующие протокол `MeteorologicalDataProtocol`.
struct WindData: MeteorologicalDataProtocol {
    /// Метка для описания ветра.
    let text = UILabel()
    
    /// Значение скорости ветра.
    let value = UILabel()
    
    /// Символ ветра.
    let symbol = UIImageView(image: UIImage(systemName: "wind"))
}
