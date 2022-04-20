//
//  SettingsViewController.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-10.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var mySwitch: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
    }
    
    
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        
        if sender.isOn {
            view.backgroundColor = .red
        }
        else {
            view.backgroundColor = .blue
        }
    }
}

