//
//  Category.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class Category {
    
    let categoryName: String
    let categoryImage: String
    let categoryDescription: String
    
    init(name: String, image: String, description: String) {
        
        self.categoryName = name
        self.categoryImage = image
        self.categoryDescription = description
    }
}
