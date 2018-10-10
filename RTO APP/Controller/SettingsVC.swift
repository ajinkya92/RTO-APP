//
//  SettingsVC.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 10/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SettingService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsData = SettingService.instance.getCategories()[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as? SettingCell else {return UITableViewCell()}
        
        cell.configureView(settings: settingsData)
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    
    
    
}
