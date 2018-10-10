//
//  ExamService.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 10/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class ExamService {
    
    static let instance = ExamService()
    
    
    func getExamJsonData(url: String, completion: @escaping examQuestionCompletionHandler) {
        
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
                    let examJsonData = try decoder.decode(Exam.self, from: data)
                    completion(examJsonData)
                }catch{
                    debugPrint(error.localizedDescription)
                    completion(nil)
                    return
                }
                
            }
            
        }.resume()
        
        
        
    }
}
