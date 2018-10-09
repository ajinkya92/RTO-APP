//
//  PracticeService.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class PracticeService {
    
    static let instance = PracticeService()
    
    
    func getPracticeData(url: String, completion: @escaping practiceQuestionCompletionHandler) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                debugPrint(error?.localizedDescription ?? "")
                completion(nil)
                return
            } else {
                
                guard let data = data else {return completion(nil)}
                let decoder = JSONDecoder()
                
                do{
                    let practiceJsonData = try decoder.decode(Practice.self, from: data)
                    completion(practiceJsonData)
                }catch{
                    debugPrint(error.localizedDescription)
                    completion(nil)
                    return
                }
                
            }
            
            
            
            
        }.resume()
        
        
    }
    
    
}
