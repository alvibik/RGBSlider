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
        addDoneButton(redTextField)
        addDoneButton(greenTextField)
        addDoneButton(blueTextField)
//        redSlider.minimumValue = 1
//        redSlider.maximumValue = 255
//        greenSlider.minimumValue = 1
//        greenSlider.maximumValue = 255
//        blueSlider.minimumValue = 1
//        blueSlider.maximumValue = 255

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
        redTextField.text = String(Int(redSlider.value))
    }
    @IBAction func greenSliderAction() {
        palette.backgroundColor = UIColor(_colorLiteralRed: redSlider.value/255, green: greenSlider.value/255, blue: blueSlider.value/255, alpha: 1)
        greenLabel.text = String(Int(greenSlider.value))
        greenTextField.text = String(Int(greenSlider.value))
    }
    @IBAction func blueSliderAction() {
        palette.backgroundColor = UIColor(_colorLiteralRed: redSlider.value/255, green: greenSlider.value/255, blue: blueSlider.value/255, alpha: 1)
        blueLabel.text = String(Int(blueSlider.value))
        blueTextField.text = String(Int(blueSlider.value))
    }
    
}

extension ViewController {
    private func addDoneButton(_ textFild: UITextField) {
        let keyboardToolbar = UIToolbar()
        textFild.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
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
}

// Show Alert for wrong Textfield wrong value
extension ViewController {
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
//extension UITextField{
//
//       @IBInspectable var doneAccessory: Bool{
//           get{
//               return self.doneAccessory
//           }
//           set (hasDone) {
//               if hasDone{
//                   addDoneButtonOnKeyboard()
//               }
//           }
//       }
//
//       func addDoneButtonOnKeyboard()
//       {
//           let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//           doneToolbar.barStyle = .default
//
//           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//           let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
//
//           let items = [flexSpace, done]
//           doneToolbar.items = items
//           doneToolbar.sizeToFit()
//
//           self.inputAccessoryView = doneToolbar
//       }
//
//       @objc func doneButtonAction() {
//           self.resignFirstResponder()
//       }
//
//   }
/*
extension UIColor {
    convenience init(_ r: Float,_ g: Float,_ b: Float,_ a: Float) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}
*/
