//
//  ViewController.swift
//  RGBSlider
//
//  Created by Александр Биктеев on 09.06.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var palette: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        palette.layer.cornerRadius = 10
        
        redSlider.minimumValue = 1
        redSlider.maximumValue = 255
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 255
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 255
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return greenTextField.resignFirstResponder()
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func redSliderAction() {
        palette.backgroundColor = UIColor(_colorLiteralRed: redSlider.value/255, green: greenSlider.value/255, blue: blueSlider.value/255, alpha: 1)
        redLabel.text = String(Int(redSlider.value))
    }
    @IBAction func greenSliderAction() {
        palette.backgroundColor = UIColor(_colorLiteralRed: redSlider.value/255, green: greenSlider.value/255, blue: blueSlider.value/255, alpha: 1)
        greenLabel.text = String(Int(greenSlider.value))
    }
    @IBAction func blueSliderAction() {
        palette.backgroundColor = UIColor(_colorLiteralRed: redSlider.value/255, green: greenSlider.value/255, blue: blueSlider.value/255, alpha: 1)
        blueLabel.text = String(Int(blueSlider.value))
    }
    

    
}
/*
extension UIColor {
    convenience init(_ r: Float,_ g: Float,_ b: Float,_ a: Float) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}
*/
