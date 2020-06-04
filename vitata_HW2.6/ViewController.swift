//
//  ViewController.swift
//  vitata_HW2.2
//
//  Created by Andrey Tolstov on 5/21/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sliders
        redSlider.value = 0.05
        greenSlider.value = 0.27
        blueSlider.value = 0.49
        
        // colorView
        colorView.layer.cornerRadius = 10
        setColor()

        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        // value labels
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }


    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redSlider: redValueLabel.text = string(from: sender)
        case greenSlider: greenValueLabel.text = string(from: sender)
        case blueSlider: blueValueLabel.text = string(from: sender)
        
        default: break
        }
        setColor()
    }

    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redValueLabel.text = string(from: redSlider)
            case 1: greenValueLabel.text = string(from: greenSlider)
            case 2: blueValueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

