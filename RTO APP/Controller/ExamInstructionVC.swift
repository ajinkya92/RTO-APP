//
//  ExamInstructionVC.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 10/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class ExamInstructionVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var outerView_StackView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outerView_StackView.layer.cornerRadius = 5.0
        outerView_StackView.clipsToBounds = true
        startButton.layer.cornerRadius = 5.0
        startButton.clipsToBounds = true
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        guard let examVC = storyboard?.instantiateViewController(withIdentifier: "ExamVC") as? ExamVC else {return}
        
        self.navigationController?.pushViewController(examVC, animated: true)
        
    }
    

}
