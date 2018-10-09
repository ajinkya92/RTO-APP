//
//  Question.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

//   let textQuestion = try? newJSONDecoder().decode(TextQuestion.self, from: jsonData)

import Foundation

typealias TextQuestion = [TextQuestionElement]

struct TextQuestionElement: Codable {
    let id, question, answer: String
}


typealias ImageQuestion = [ImageQuestionElement]

struct ImageQuestionElement: Codable {
    let id: String
    let image: String
    let name: String
}

