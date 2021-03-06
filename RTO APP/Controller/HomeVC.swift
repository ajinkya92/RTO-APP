//
//  ViewController.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return HomeServices.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell") as? HomeTableCell else {return UITableViewCell()}
        
        let categories = HomeServices.instance.getCategories()[indexPath.row]
        
        cell.configureView(category: categories)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            guard let questionBankVC = storyboard?.instantiateViewController(withIdentifier: "QuestionBankVC") as? QuestionBankVC else {return}
            navigationController?.pushViewController(questionBankVC, animated: true)
            navigationController?.topViewController?.title = "Question Bank"
            
        } else if indexPath.row == 1 {
            
            guard let practiceVC = storyboard?.instantiateViewController(withIdentifier: "PracticeVC") as? PracticeVC else {return}
            navigationController?.pushViewController(practiceVC, animated: true)
            navigationController?.topViewController?.title = "Practice"
            
        } else if indexPath.row == 2 {
            
            guard let examInstructionVC = storyboard?.instantiateViewController(withIdentifier: "ExamInstructionVC") as? ExamInstructionVC else {return}
            navigationController?.pushViewController(examInstructionVC, animated: true)
            navigationController?.topViewController?.title = "Exam"
            
        } else {
            
            guard let settingsVC = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC else {return}
            
            navigationController?.pushViewController(settingsVC, animated: true)
            navigationController?.topViewController?.title = "Settings"
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 2, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 2, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

