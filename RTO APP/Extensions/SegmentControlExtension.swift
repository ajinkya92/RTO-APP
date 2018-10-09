//
//  SegmentControlExtension.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    
    func setupSegmentControl() {
        
        let font = UIFont(name: "AvenirNext-Medium", size: 20)!
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: font], for: .normal)
        self.tintColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5137254902, alpha: 0.8)
        self.setEnabled(true, forSegmentAt: 0)
        
        
        
    }
    
    
}
