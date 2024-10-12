//
//  ViewController.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 10.10.2024.
//

import UIKit
import SnapKit


class MainView: UIView {
    // MARK: - UI Elements
    private let picker = UIPickerView()
    
    private let maxTemperatureLabel = UILabel()
    private let minTemperatureLabel = UILabel()
    private let averageTemperatureStack = UIStackView()
    
    private let humidityLabel = UILabel()
    private let windSpeedLabel = UILabel()
    
    private let currentTemperatureLabel = UILabel()
    
    private let stripView = UIView()
    
    private let desсriptionLabel = UILabel()
    
    private let backgroundImageView = UIImageView(image: UIImage(named: "backgroundNoise"))

    // MARK: - Life Cycle
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
extension MainView {
    func updateData(_ data: WeatherData) {
        maxTemperatureLabel.attributedText = addAttachmentsToText(text: data.maxTemperature, arrow: SFArrowDirection.up)
        minTemperatureLabel.attributedText = addAttachmentsToText(text: data.minTemperature, arrow: SFArrowDirection.down)
    }
}


// MARK: - Main Private Methods

private extension MainView {
    func setupViews() {
        addSubviews(backgroundImageView, picker, averageTemperatureStack)
    }
    
    func setupAppearance() {
        self.backgroundColor = .white
        
        makeTemperatureStack()
    }
    
    func setupLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        picker.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        averageTemperatureStack.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: - Other Private Methods
private extension MainView {
    func makeTemperatureStack() {
        averageTemperatureStack.axis = .vertical
        averageTemperatureStack.spacing = 30
        averageTemperatureStack.distribution = .fillEqually
        averageTemperatureStack.alignment = .center
        [maxTemperatureLabel, minTemperatureLabel].forEach { averageTemperatureStack.addArrangedSubview($0) }
    }
    
    func addAttachmentsToText(text: Double, arrow: SFArrowDirection) -> NSAttributedString {
        
        let text = String(text)
        let size: CGFloat = 20
        let attachmentSize: CGFloat = size - 2
        
        let symbolAttachment = NSTextAttachment()
        symbolAttachment.image = UIImage(systemName: arrow.rawValue)?.applyingSymbolConfiguration(.init(pointSize: attachmentSize))!.withTintColor(.text)
        let symbolString = NSAttributedString(attachment: symbolAttachment)
        
        let degreesAttachment = NSTextAttachment()
        degreesAttachment.image = UIImage(systemName: "degreesign.celsius")?.applyingSymbolConfiguration(.init(pointSize: attachmentSize))!.withTintColor(.text)
        let degreesString = NSAttributedString(attachment: degreesAttachment)
        
        let attributedText = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: size, weight: .medium),
            .foregroundColor: UIColor.text
        ])
        
        let combinedText = NSMutableAttributedString()
        combinedText.append(symbolString)
        combinedText.append(NSAttributedString(string: "  "))
        combinedText.append(attributedText)
        combinedText.append(degreesString)
        
        return combinedText
    }
}
