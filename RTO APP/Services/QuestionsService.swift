//
//  QuestionsService.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class QuestionsService {
    
    static let instance = QuestionsService()
    
    
    // MARK: GET TEXT QUESTION DATA
    
    func getTextQuestionData(url: String, completion: @escaping textQuestionCompletionHandler) {
        
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
                    
                    let textQuestionJson = try decoder.decode(TextQuestion.self, from: data)
                    completion(textQuestionJson)
                } catch{
                    debugPrint(error.localizedDescription)
                    completion(nil)
                    return
                }
                
            }
            
        }.resume()
        
    }
    
    
    // MARK: GET IMAGE QUESTION DATA
    
    func getImageQuestionData(url: String, completion: @escaping imageQuestionCompletionHandler) {
        
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
                    let imageJsonData = try decoder.decode(ImageQuestion.self, from: data)
                    completion(imageJsonData)
                } catch{
                    debugPrint(error.localizedDescription)
                    completion(nil)
                    return
                }
                
            }
            
        }.resume()
        
        
    }
    
}
