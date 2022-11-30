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
    
    var dataString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColorOutlet.layer.cornerRadius = 20
        setColor()
        setValueForTextField()
        
        addDoneButtonTo(redTFOutlet)
        addDoneButtonTo(greenTFOutlet)
        addDoneButtonTo(blueTFOutlet)
        
    }

    @IBAction func sliderColorAction(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redTFOutlet.text = string(from: sender)
        case 1:
            greenTFOutlet.text = string(from: sender)
        case 2:
            blueTFOutlet.text = string(from: sender)
        default: break
        }
        
        setColor()
    }
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        viewColorOutlet.backgroundColor = viewColorOutlet.backgroundColor?.withAlphaComponent(currentValue)
        opacityTF.text = string(from: sender)
    }
    
    
    
    // MARC: - Private func
    
    private func setColor() {
        viewColorOutlet.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value),
                                                  green: CGFloat(greenSliderOutlet.value),
                                                  blue: CGFloat(blueSliderOutlet.value),
                                                  alpha: 1)
    }
    
    private func setValueForTextField() {
        redTFOutlet.text = string(from: redSliderOutlet)
        greenTFOutlet.text = string(from: greenSliderOutlet)
        blueTFOutlet.text = string(from: blueSliderOutlet)
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0: redSliderOutlet.value = currentValue
            case 1: greenSliderOutlet.value = currentValue
            case 2: blueSliderOutlet.value = currentValue
            default: break
            }
            
            setColor()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
    }
    
    private func addDoneButtonTo(_ textField: UITextField) {
        // Метод для отображения кнопки "Готово" на цифровой клавиатуре
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


