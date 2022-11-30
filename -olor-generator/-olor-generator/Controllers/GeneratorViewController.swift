//
//  GeneratorViewController.swift
//  -olor-generator
//
//  Created by dzmitry on 30.11.22.
//

import UIKit

class GeneratorViewController: UIViewController {
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColor()
        setValueForTextField()
    }

    @IBAction func sliderColorAction(_ sender: UISlider) {
        switch sender.tag {
            case 0:
                redTFOutlet.text = string(from: sender)
            case 1:
                greenTFOutlet.text = string(from: sender)
            case 2:
                blueTFOutlet.text = string(from: sender)
            default:
                break
            }
            setColor()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
