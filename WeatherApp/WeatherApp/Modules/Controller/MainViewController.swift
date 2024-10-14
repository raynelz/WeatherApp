//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 10.10.2024.
//

import UIKit

class MainViewController: GenericViewController<MainView> {
    
    lazy var data = [convertToWeatherData(MockData.mockWeatherResponse)]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
    }
}

// MARK: - Private Methods
private extension MainViewController {
//    func fetchData() async {
//        let networkService = NetworkService()
//        networkService.fetchData(url: Cities.moscow.rawValue) { (result: Result<WeatherResponse, Error>) in
//            switch result {
//            case .success(let data):
//                self.data = data
//            case .failure:
//                let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
//                alert.addAction(.init(title: "OK", style: .default))
//                self.present(alert, animated: true)
//            }
//        }
//    }
    
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
    
    func convertToWeatherData(_ data: WeatherResponse) -> WeatherData {
        let weatherData = WeatherData(
            city: data.name,
            currentTemperature: Int(data.main.temp),
            maxTemperature: Int(data.main.tempMax),
            minTemperature: Int(data.main.tempMin),
            description: data.weather.first?.description ?? "",
            windSpeed: Int(data.wind.speed),
            humidity: Int(data.main.humidity)
        )
        return weatherData
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
