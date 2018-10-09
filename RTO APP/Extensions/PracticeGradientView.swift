//
//  PracticeGradientView.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
@IBDesignable

class PracticeGradientView: UIView {
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.7411764706, green: 0.7647058824, blue: 0.7803921569, alpha: 1) {
        
        didSet {
            
            self.setNeedsLayout()
        }
        
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.3137254902, alpha: 1) {
        
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
