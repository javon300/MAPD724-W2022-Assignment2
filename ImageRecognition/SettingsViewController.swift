//
//  SettingsViewController.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-10.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

class SettingsViewController: UIViewController {

    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Helper Functions
    
    func configureTableView()
    {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationItem.title = "Settings"
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section
        {
            case 1: return 2
            case 2: return 3
            default: return 0
        }
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .black
//        let title = UILabel()
//        title.font = UIFont.boldSystemFont(ofSize: 16)
//        title.textColor = .white
//        view.addSubview(title)
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
       
        switch indexPath.section
        {
        case 1: cell.backgroundColor = .gray
        case 2: cell.backgroundColor = .gray
        default: break
        }
        return cell
    }
}

//    @IBOutlet var mySwitch: UISwitch!
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//
//        overrideUserInterfaceStyle = .dark
//    }
//
//
//
//    @IBAction func switchDidChange(_ sender: UISwitch) {
//
//        if sender.isOn {
//            view.backgroundColor = .red
//        }
//        else {
//            view.backgroundColor = .blue
//        }
//    }
//}

