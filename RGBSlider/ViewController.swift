//
//  ViewController.swift
//  RGBSlider
//
//  Created by albik on 26.10.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var redLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func setRedSlider() {
        redLabel.text = "\(round(redSlider.value * 100) / 100)"
    }
    
}
