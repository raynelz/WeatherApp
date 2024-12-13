//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 10.10.2024.
//

import UIKit

/// ViewController для управления `MainView` и фетчинга погодных данных
final class MainViewController: GenericViewController<MainView> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Private Methods
private extension MainViewController {
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


#Preview(traits: .portrait) {
	MainViewController()
}
