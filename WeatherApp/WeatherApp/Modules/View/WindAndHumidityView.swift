//
//  WindAndHumidityView.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 12.10.2024.
//

import UIKit
import SnapKit

class WindAndHumidityView: UIView {
    
    let windData = WindData()
    let humidityData = HumidityData()
    
    private let generalStack = UIStackView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupAppearance()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension WindAndHumidityView {
    func updateValues(humidityValue: Double, windValue: Double) {
        windData.value.text = "\(windValue) m/s"
        humidityData.value.text = "\(humidityValue) %"
    }
}

// MARK: - Private Methods
private extension WindAndHumidityView {
    func setupViews() {
        self.addSubviews()
    }
    
    func setupAppearance() {
        makeElementsAppearance([windData, humidityData])
    }
    
    func setupLayout() {
        
    }
}

private extension WindAndHumidityView {
    func makeElementsAppearance(_ elements: [MeteorologicalDataProtocol]) {
        elements.forEach { element in
            [element.text, element.value].forEach { label in
                label.font = .systemFont(ofSize: 20, weight: .light)
                label.textColor = .text
            }
            if let image = element.symbol.image {
                element.symbol.image = image
                    .withTintColor(.text)
                    .applyingSymbolConfiguration(
                        UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20, weight: .light))
                    )
            }
        }
    }
}
