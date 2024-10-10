//
//  UIView+AddSubviews.swift
//  WeatherApp
//
//  Created by Станислав Никулин on 10.10.2024.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubviews($0) }
    }
}
