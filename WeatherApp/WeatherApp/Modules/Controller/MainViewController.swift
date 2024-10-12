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
        
        rootView.picker.delegate = self
        rootView.picker.dataSource = self
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func updateUI() {
        rootView.updateData(data[0])
    }
}

extension MainViewController: UIPickerViewDelegate {
    
}

extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "Bobir"
    }
    
}
