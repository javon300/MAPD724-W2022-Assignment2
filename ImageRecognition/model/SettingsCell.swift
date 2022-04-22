//
//  SettingsCell.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-20.
//

import UIKit

class SettingsCell: UITableViewCell
{
    var sectionType: SectionType?{
        didSet{
            guard let sectionType = sectionType else {return }

            textLabel?.text = sectionType.description
            switchControl.isHidden = !sectionType.containSwitch
        }
    }
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.onTintColor = .black
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return switchControl
    }()
    
    //init funcs
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(switchControl)
        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //switch handler
    @objc func handleSwitchAction(sender: UISwitch)
    {
        if sender.isOn{
            print("turned on")
        }
        else{
            print("turned on")
        }
        
    }
}
