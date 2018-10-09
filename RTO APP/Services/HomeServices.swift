//
//  HomeServices.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class HomeServices {
    
    static let instance = HomeServices()
    
    private let categories = [
        
        Category(name: "Question Bank", image: "question", description: "List of questions & answers and meaning of road signs"),
        
        Category(name: "Practice", image: "practice", description: "Test your knowledge wihout worrying about time"),
        
        Category(name: "Exam", image: "exam", description: "Time and question bound test exactly same as actual RTO test"),
        
        Category(name: "Settings & Help", image: "settings", description: "Language selection, forms, RTO office information and more")
    
    ]
    
    func getCategories() -> [Category] {
        
        return categories
    }
    
}
