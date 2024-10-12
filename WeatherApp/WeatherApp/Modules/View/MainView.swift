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
        
    }
}


// MARK: - Main Private Methods

private extension MainView {
    func setupViews() {
        addSubviews(backgroundImageView, picker)
    }
    
    func setupAppearance() {
        self.backgroundColor = .white
        
        temperatureLabelsSetup()
    }
    
    func setupLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        picker.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
    }
}

// MARK: - Other Private Methods
private extension MainView {
    func temperatureLabelsSetup() {
        
    }
    func addArrowToText(text: String, arrow: SFArrowDirection) -> String {
        
        
        let symbolAttachment = NSTextAttachment()
        symbolAttachment.image = UIImage(systemName: arrow.rawValue)
        
        let symbolString = NSAttributedString(attachment: symbolAttachment)
        
        let attributedText = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor.text,
            .attachment: symbolAttachment
        ])
        
        
        return attributedText.string
    }
}
