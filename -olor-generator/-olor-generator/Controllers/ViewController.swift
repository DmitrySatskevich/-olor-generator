//
//  ViewController.swift
//  -olor-generator
//
//  Created by dzmitry on 30.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    var redSliderValue: CGFloat!
    var greenSliderValue: CGFloat!
    var blueSliderValue: CGFloat!
    
    @IBOutlet weak var cangeBGOutlet: UIButton!
    
    // MARK: - IBAction

    @IBAction func cangeBGButton(_ sender: UIButton) {
        let vc = GeneratorViewController(nibName: "GeneratorViewController", bundle: nil)
        vc.delegate = self
        vc.colorFromMainVC = view.backgroundColor
        vc.redSliderValue = redSliderValue
        vc.greenSliderValue = greenSliderValue
        vc.blueSliderValue = blueSliderValue
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: - extension

extension ViewController: ColorDelegate {
    func updateSlider(red: CGFloat, green: CGFloat, blue: CGFloat) {
        redSliderValue = red
        greenSliderValue = green
        blueSliderValue = blue
    }
    
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
