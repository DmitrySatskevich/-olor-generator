//
//  ViewController.swift
//  -olor-generator
//
//  Created by dzmitry on 30.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cangeBGOutlet: UIButton!
    
    // MARK: - IBAction

    @IBAction func cangeBGButton(_ sender: UIButton) {
        let vc = GeneratorViewController(nibName: "GeneratorViewController", bundle: nil)
        vc.delegate = self
        vc.colorFromMainVC = view.backgroundColor
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: - extension

extension ViewController: ColorDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
