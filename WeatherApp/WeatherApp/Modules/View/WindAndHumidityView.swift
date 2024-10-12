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
    
    private let symbolStack = UIStackView()
    private let textStack = UIStackView()
    private let valueStack = UIStackView()
    
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
        self.addSubviews(generalStack)
    }
    
    func setupAppearance() {
        windData.text.text = "Ветер"
        humidityData.text.text = "Влажность"
        
        symbolStack.tag = 1
        
        makeElementsAppearance([windData, humidityData])
        setStack(stack: symbolStack, [windData.symbol, humidityData.symbol])
        setStack(stack: textStack, [windData.text, humidityData.text])
        setStack(stack: valueStack, [windData.value, humidityData.value])
        
        setGeneralStack([symbolStack, textStack, valueStack])
    }
    
    func setupLayout() {
        generalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

private extension WindAndHumidityView {
    func makeElementsAppearance(_ elements: [MeteorologicalDataProtocol]) {
        let size: CGFloat = 15
        elements.forEach { element in
            [element.text, element.value].forEach { label in
                label.font = .systemFont(ofSize: size, weight: .light)
                label.textColor = .text
            }
            if let image = element.symbol.image {
                element.symbol.image = image
                    .withTintColor(.text)
                    .applyingSymbolConfiguration(
                        UIImage.SymbolConfiguration(font: .systemFont(ofSize: size, weight: .light))
                    )
            }
        }
    }
    func setStack(stack: UIStackView,_ data:[UIView]) {
        switch stack.tag {
            case 1:
                stack.alignment = .trailing
            default:
                stack.alignment = .leading
        }
        
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        data.forEach {
            stack.addArrangedSubview($0)
        }
    }
    func setGeneralStack(_ stacks: [UIStackView]) {
        generalStack.axis = .horizontal
        generalStack.distribution = .fill
        generalStack.spacing = 10
        stacks.forEach {
            generalStack.addArrangedSubview($0)
        }
    }
}
