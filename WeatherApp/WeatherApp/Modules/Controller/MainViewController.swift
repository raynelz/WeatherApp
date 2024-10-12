//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 10.10.2024.
//

import UIKit

class MainViewController: GenericViewController<MainView> {
    
    let data = MockData.mockData

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func updateUI() {
        rootView.updateData(data[0])
    }
}

