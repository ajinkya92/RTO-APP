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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            guard let contactVC = storyboard?.instantiateViewController(withIdentifier: "ContactVC") as? ContactVC else {return}
            self.present(contactVC, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            
            let activityVC = UIActivityViewController(activityItems: ["Share RTO APP with all the best question series you will need to clear the RTO Exam"], applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = self.view
            
            self.present(activityVC, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    
    
    
}
