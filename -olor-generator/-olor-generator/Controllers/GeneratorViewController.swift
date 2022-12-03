//
//  GeneratorViewController.swift
//  -olor-generator
//
//  Created by dzmitry on 30.11.22.
//

import UIKit

class GeneratorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    @IBOutlet weak var redTFOutlet: UITextField!
    @IBOutlet weak var greenTFOutlet: UITextField!
    @IBOutlet weak var blueTFOutlet: UITextField!
    
    @IBOutlet weak var hexColorOutlet: UITextField!
    
    @IBOutlet weak var opacityOutlet: UISlider!
    @IBOutlet weak var opacityTF: UITextField!
    @IBOutlet weak var viewColorOutlet: UIView!
    
    var delegate: ColorDelegate?
    var colorFromMainVC: UIColor!
    
    var redSliderValue: CGFloat!
    var greenSliderValue: CGFloat!
    var blueSliderValue: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColorOutlet.layer.cornerRadius = 20
        setColor()
        setValueForTextField()
        
        viewColorOutlet.backgroundColor = colorFromMainVC
//        redSliderOutlet.value = Float(redSliderValue)
//        greenSliderOutlet.value = Float(greenSliderValue)
//        blueSliderOutlet.value = Float(blueSliderValue)
    }

    @IBAction func sliderColorAction(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redTFOutlet.text = string(from: sender)
        case 1:
            greenTFOutlet.text = string(from: sender)
        case 2:
            blueTFOutlet.text = string(from: sender)
        case 3:
            opacityTF.text = string(from: sender)
        default: break
        }
        
        setColor()
    }
    
    @IBAction func goToRoatVC(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setColor() {
        let newColor = UIColor(red: CGFloat(redSliderOutlet.value / 255),
                               green: CGFloat(greenSliderOutlet.value / 255),
                               blue: CGFloat(blueSliderOutlet.value / 255),
                               alpha: CGFloat(opacityOutlet.value / 100))
        viewColorOutlet.backgroundColor = newColor
        delegate?.setColor(newColor)
        delegate?.updateSlider(red: CGFloat(redSliderOutlet.value),
                               green: CGFloat(greenSliderOutlet.value),
                               blue: CGFloat(opacityOutlet.value))
    }
    
    private func setValueForTextField() {
        redTFOutlet.text = string(from: redSliderOutlet)
        greenTFOutlet.text = string(from: greenSliderOutlet)
        blueTFOutlet.text = string(from: blueSliderOutlet)
        opacityTF.text = string(from: opacityOutlet)
    }
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    // Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
}
 


