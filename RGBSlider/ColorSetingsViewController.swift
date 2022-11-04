//
//  ViewController.swift
//  RGBSlider
//
//  Created by albik on 26.10.2022.
//

import UIKit

final class ColorSetingsViewController: UIViewController {
    
    // MARK: 1. - IBOutlets
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var rgbView: UIView!
    
    var colorSetings: UIColor!
    var delegate: ColorViewControllerDelegate!
    
    // MARK: 6. - Override class methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 20
        rgbView.backgroundColor = colorSetings
        setValueForSliders(redSlider, greenSlider, blueSlider)
        setValueForLabels(redLabel, greenLabel, blueLabel)
        setValueForTextFields(redTextField, greenTextField, blueTextField)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: 7. - IBActions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setValueForLabels(redLabel, greenLabel, blueLabel)
        setValueForTextFields(redTextField, greenTextField, blueTextField)
        setColorForRGBView()
    }
    
    @IBAction func doneButtonAction() {
        delegate?.setBackgroundColor(rgbView.backgroundColor ?? .gray)
        dismiss(animated: true)
    }
    
    // MARK: 9. - Private methods
    
    private func setValueForSliders(_ colorsSliders: UISlider...) {
        let color = CIColor(color: colorSetings)
        
        for slider in colorsSliders {
            if slider == redSlider {
                redSlider.value = Float(color.red)
            } else if
                slider == greenSlider {
                greenSlider.value = Float(color.green)
            } else if
                slider == blueSlider {
                blueSlider.value = Float(color.blue)
            }
        }
    }
    
    private func setValueForLabels(_ colorsLabels: UILabel...) {
        for label in colorsLabels {
            if label == redLabel {
                redLabel.text = String(format: "%.2f", redSlider.value)
            } else if label == greenLabel {
                greenLabel.text = String(format: "%.2f", greenSlider.value)
            } else if label == blueLabel {
                blueLabel.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    
    private func setValueForTextFields(_ colorsTextField: UITextField...) {
        for textField in colorsTextField {
            if textField == redTextField {
                redTextField.text = String(format: "%.2f", redSlider.value)
            } else if textField == greenTextField {
                greenTextField.text = String(format: "%.2f", greenSlider.value)
            } else if textField == blueTextField {
                blueTextField.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    private func setColorForRGBView() {
        rgbView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    @objc private func doneClicked() {
        view.endEditing (true)
    }
}

// MARK: 10. - Extension UITextFieldDelegate

extension ColorSetingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        switch text {
        case redTextField.text:
            redSlider.setValue(Float(text) ?? 1, animated: true)
        case greenTextField.text:
            greenSlider.setValue(Float(text) ?? 0.5, animated: true)
        case blueTextField.text:
            blueSlider.setValue(Float(text) ?? 0, animated: true)
        default:
            break
        }
        setValueForLabels(redLabel, greenLabel, blueLabel)
        setColorForRGBView()
        return
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action:
        #selector (self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        
        textField.inputAccessoryView = toolBar
        
    }
}



