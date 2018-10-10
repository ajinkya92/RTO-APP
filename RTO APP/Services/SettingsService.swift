//
//  SettingsService.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 10/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class SettingService {
    
    static let instance = SettingService()
    
    let categories = [
        Settings(name: "Contact US", iconImage: "contact"),
        Settings(name: "Share App", iconImage: "share"),
        Settings(name: "Rate App", iconImage: "rating")

    ]
    
    func getCategories() -> [Settings] {
        
        return categories
    }
    
    
}
