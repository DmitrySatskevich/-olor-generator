//
//  ColorDelegate.swift
//  -olor-generator
//
//  Created by dzmitry on 1.12.22.
//

import UIKit

protocol ColorDelegate {
    func setColor(_ color: UIColor)
    func updateSlider(red: CGFloat, green: CGFloat, blue: CGFloat)
}
