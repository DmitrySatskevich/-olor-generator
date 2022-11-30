//
//  ViewController.swift
//  -olor-generator
//
//  Created by dzmitry on 30.11.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cangeBGButton(_ sender: UIButton) {
        let vc = GeneratorViewController(nibName: "GeneratorViewController", bundle: nil)
            vc.dataString = "Привет из Первого"
            vc.navigationItem.title = "XIB VC"
            navigationController?.pushViewController(vc, animated: true)
    }
    
}

