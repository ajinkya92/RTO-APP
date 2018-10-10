//
//  Practice.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

typealias Practice = [PracticeElement]

struct PracticeElement: Codable {
    let id, question, option1, option2: String
    let option3, answer: String
    
    enum CodingKeys: String, CodingKey {
        case id, question
        case option1 = "option_1"
        case option2 = "option_2"
        case option3 = "option_3"
        case answer
    }
}
