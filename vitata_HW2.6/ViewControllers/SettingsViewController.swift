//
//  ViewController.swift
//  vitata_HW2.2
//
//  Created by Andrey Tolstov on 5/21/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setMainViewColor(_ color: UIColor)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    public var currentColor: UIColor!
    
    
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting sliders values
        redSlider.value = currentColor.getRedFloat
        greenSlider.value = currentColor.getGreenFloat
        blueSlider.value = currentColor.getBlueFloat
        
        // colorView
        colorView.layer.cornerRadius = 15
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        // updating View Color
        setMiniViewColor()
        
        // updating Text on Labels
        setValueLabels(for: redValueLabel, greenValueLabel, blueValueLabel)
        
        // updating Text on TextFields
        setValueTextFields(for: redTextField, greenTextField, blueTextField)
        
        
        // toolbars for numeric keyboard
        showToolbarDoneButton(for: redTextField)
        showToolbarDoneButton(for: greenTextField)
        showToolbarDoneButton(for: blueTextField)
        

    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {

        syncAll(from: sender)
        
    }
    
    @IBAction func doneButton() {
        guard let color = colorView.backgroundColor else { return }
        delegate.setMainViewColor(color)
        dismiss(animated: true)
    }

    
    private func setMiniViewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValueLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redValueLabel.text = string(from: redSlider)
            case 1: greenValueLabel.text = string(from: greenSlider)
            case 2: blueValueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setValueTextFields(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redTextField.text = string(from: redSlider)
            case 1: greenTextField.text = string(from: greenSlider)
            case 2: blueTextField.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setSlidersPosition(for sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider.tag {
            case 0: redSlider.value = float(from: redTextField)
            case 1: greenSlider.value = float(from: greenTextField)
            case 2: blueSlider.value = float(from: blueTextField)
            default: break
            }
        }
    }
    
    
    
    
    private func float(from textField: UITextField) -> Float {
        return (textField.text! as NSString).floatValue
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    private func syncAll(from source: Any?) {
        
        if (source as? UITextField) != nil {
            setSlidersPosition(for: redSlider, greenSlider, blueSlider)
        } else if (source as? UISlider) != nil {
            setValueTextFields(for: redTextField, greenTextField, blueTextField)
        } else { return }
        
        setMiniViewColor()
        setValueLabels(for: redValueLabel, greenValueLabel, blueValueLabel)
        
    }

}


// MARK: Text Field Delegate
extension SettingsViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textFieldDidEndEditing(redTextField)
    }
    
    private func showToolbarDoneButton(for textfield: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.ToolbarDoneButtonClicked))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        textfield.inputAccessoryView = toolbar
    }
    
    @objc func ToolbarDoneButtonClicked () {
        textFieldDidEndEditing(redTextField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        syncAll(from: textField)
        view.endEditing(true)
        
    }
}
