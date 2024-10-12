//
//  WindAndHumidityView.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 12.10.2024.
//

import UIKit
import SnapKit

class WindAndHumidityView: UIView {
    
    private let humidityTextLabel = UILabel()
    private let windTextLabel = UILabel()
    
    private let humidityPercentLabel = UILabel()
    private let windSpeedLabel = UILabel()
    
    private let humiditySymbol = UIImageView(image: UIImage(named: "humidity"))
    private let windSymbol = UIImageView(image: UIImage(named: "wind"))
    
    private let symbolsStack = UIStackView()
    private let valuesStack = UIStackView()
    private let labelsStack = UIStackView()
    
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
        windSpeedLabel.text = "\(windValue) m/s"
        humidityPercentLabel.text = "\(humidityValue) %"
    }
}

// MARK: - Private Methods
private extension WindAndHumidityView {
    func setupViews() {
        self.addSubviews()
    }
    
    func setupAppearance() {
        
    }
    
    func setupLayout() {
        
    }
}

private extension WindAndHumidityView {
    func makeText(elements: [UIView]) {
        elements.forEach { element in
            if let label = element as? UILabel {
                label.font = .systemFont(ofSize: 20, weight: .light)
                label.textColor = .text
            } else if let imageView = element as? UIImageView {
                imageView.image?.withTintColor(.text)
                imageView.image?.applyingSymbolConfiguration(UIImage.SymbolConfiguration.init(font: .systemFont(ofSize: 20, weight: .light)))
            }
        }
    }
}
