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
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Main Private Methods

private extension MainView {
    func setupViews() {
//        view.addSubviews()
    }
    
    func setupAppearance() {
        
    }
    
    func setupLayout() {
        
    }
}

// MARK: - Other Private Methods
private extension MainView {
    
}
