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
    
    private let windAndHumidityView = WindAndHumidityView()
    private let currentTemperatureLabel = UILabel()
    
    private let stripView = UIView()
    
    private let desсriptionLabel = UILabel()
    
    private let backgroundImageView = UIImageView(image: UIImage(named: "backgroundNoise"))

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
extension MainView {
    func updateData(_ data: WeatherData) {
        maxTemperatureLabel.attributedText = addAttachmentsToText(text: data.maxTemperature, arrow: SFArrowDirection.up)
        minTemperatureLabel.attributedText = addAttachmentsToText(text: data.minTemperature, arrow: SFArrowDirection.down)
        
        windAndHumidityView.updateValues(humidityValue: data.humidity, windValue: data.windSpeed)
        
        currentTemperatureLabel.text = "\(data.currentTemperature)"
    }
}


// MARK: - Main Private Methods

private extension MainView {
    func setupViews() {
        addSubviews(backgroundImageView, picker, averageTemperatureStack, windAndHumidityView, stripView, currentTemperatureLabel)
    }
    
    func setupAppearance() {
        self.backgroundColor = .white
        
        makeTemperatureStack()
        
        stripView.backgroundColor = .text
        
        currentTemperatureLabel.textColor = .text
        currentTemperatureLabel.font = .systemFont(ofSize: 60, weight: .bold)
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
        
        currentTemperatureLabel.snp.makeConstraints {
            $0.leading.equalTo(stripView.snp.leading)
            $0.bottom.equalTo(stripView.snp.top).offset(-10)
        }
        
        stripView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(windAndHumidityView.snp.top).offset(-20)
            $0.height.equalTo(2)
        }
        
        windAndHumidityView.snp.makeConstraints {
            $0.leading.equalTo(stripView.snp.leading)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(30)
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
        let size: CGFloat = 15
        let attachmentSize: CGFloat = size - 2
        
        let symbolAttachment = NSTextAttachment()
        symbolAttachment.image = UIImage(systemName: arrow.rawValue)?
            .applyingSymbolConfiguration(
                .init(font: .systemFont(ofSize: attachmentSize, weight: .light))
            )!
            .withTintColor(.text)
        let symbolString = NSAttributedString(attachment: symbolAttachment)
        
        let degreesAttachment = NSTextAttachment()
        degreesAttachment.image = UIImage(systemName: "degreesign.celsius")?
            .applyingSymbolConfiguration(
                .init(font: .systemFont(ofSize: attachmentSize, weight: .light))
            )!
            .withTintColor(.text)
        let degreesString = NSAttributedString(attachment: degreesAttachment)
        
        let attributedText = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: size, weight: .light),
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
