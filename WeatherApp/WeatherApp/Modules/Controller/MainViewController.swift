//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 10.10.2024.
//

import UIKit

class MainViewController: GenericViewController<MainView> {
    
    var data: WeatherData? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegates()
        
        Task {
            await fetchData(city: Cities.moscow.rawValue)
        }
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func fetchData(city: Cities.RawValue) async {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=f331839ab98646bea31153256241410&q=\(city)&days=1&lang=ru"
        print(url)
        let networkService = NetworkService()
        networkService.fetchData(url: url) { (result: Result<WeatherResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.data = self.convertToWeatherData(data)
                    self.updateUI()
                case .failure(let error):
                    print("\(error.localizedDescription)")
                    let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
                    alert.addAction(.init(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func updateUI() {
        rootView.updateData(data)
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
        let forecast = data.forecast.forecastday.first?.day
        
        let weatherData = WeatherData(
            city: data.location.name,
            currentTemperature: Int(data.current.tempC),
            maxTemperature: Int(forecast?.maxtempC ?? 0),
            minTemperature: Int(forecast?.mintempC ?? 0),
            description: data.current.condition.text,
            windSpeed: Int(data.current.windKph),
            humidity: data.current.humidity
        )
        
        return weatherData
    }
}

extension MainViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Task {
            await fetchData(city: Cities.allCases[row].rawValue)
        }
        rootView.updateData(data)
    }
}

extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Cities.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        makeAttributedString(Cities.allCases[row].rawValue)
    }
}
