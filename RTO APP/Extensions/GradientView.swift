//
//  GradientView.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
@IBDesignable

class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor =  #colorLiteral(red: 0.5254901961, green: 0.5607843137, blue: 0.5882352941, alpha: 1) {
        
        didSet {
            self.setNeedsLayout()
        }
    }

    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.3490196078, green: 0.3803921569, blue: 0.3921568627, alpha: 1) {
        
        didSet {
            
            self.setNeedsLayout()
        }
        
    }
    
    
    override func layoutSubviews() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
