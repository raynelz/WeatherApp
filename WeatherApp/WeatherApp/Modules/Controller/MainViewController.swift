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
        setupUI()
        setupDelegates()
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setupUI() {
        rootView.updateData(data.first!)
    }
    func setupDelegates() {
        rootView.picker.delegate = self
        rootView.picker.dataSource = self
    }
    
    func makeAttributedString(_ text: String) -> NSAttributedString {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.text
            ]
        )
        return attributedString
    }
}

extension MainViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rootView.updateData(data[row])
    }
}

extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        makeAttributedString(data[row].city)
    }
}
