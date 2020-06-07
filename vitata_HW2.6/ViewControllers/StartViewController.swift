//
//  StartViewController.swift
//  vitata_HW2.6
//
//  Created by Svetlana Tolstova on 6/6/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    private var backColor = UIColor(red: 1.0, green: 0.27, blue: 0.49, alpha: 1.0)


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func openSettingsButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "showSettingsSegue", sender: nil)
        
    }

}

extension StartViewController: SettingsViewControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showSettingsSegue" else { return }
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.currentColor = view.backgroundColor
        settingsVC.delegate = self
    }
    
    func setMainViewColor(_ color: UIColor) {
        view.backgroundColor = color
        
    }
    
    
}
