//
//  ViewController.swift
//  RGBSlider
//
//  Created by albik on 26.10.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var rgbView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 20
    }


    @IBAction func setRedSlider() {
        redLabel.text = "\(round(redSlider.value * 100) / 100)"
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    @IBAction func setGreenSlider() {
        greenLabel.text = "\(round(greenSlider.value * 100) / 100)"
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    @IBAction func setBlueSlider() {
        blueLabel.text = "\(round(blueSlider.value * 100) / 100)"
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}
