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
    
    
    private func colorViewUpdate(red: Float, green: Float, blue: Float) {
        colorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sliders
        redSlider.value = 0.05
        greenSlider.value = 0.27
        blueSlider.value = 0.49
        
        // colorView
        colorView.layer.cornerRadius = 10
        colorViewUpdate(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)

        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        // value labels
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }

   
    @IBAction func redSliderMove() {
        redValueLabel.text = String((redSlider.value * 100).rounded() / 100)
        colorViewUpdate(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    @IBAction func greenSliderMove() {
        greenValueLabel.text = String((greenSlider.value * 100).rounded() / 100)
        colorViewUpdate(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    @IBAction func bluesSliderMove() {
        blueValueLabel.text = String((blueSlider.value * 100).rounded() / 100)
        colorViewUpdate(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    
    
}

