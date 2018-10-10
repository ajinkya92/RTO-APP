//
//  Constants.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

let TEXT_QUESTION_URL = "http://mapi.trycatchtech.com/v1/rto/text_question_list"

let IMAGE_QUESTION_URL = "http://mapi.trycatchtech.com/v1/rto/image_question_list"

let PRACTICE_URL = "http://mapi.trycatchtech.com/v1/rto/practice_question_list"

let EXAM_URL = "http://mapi.trycatchtech.com/v1/rto/exam_question_list"



// Completion Handlers

typealias textQuestionCompletionHandler = (TextQuestion?)-> ()
typealias imageQuestionCompletionHandler = (ImageQuestion?)-> ()
typealias practiceQuestionCompletionHandler = (Practice?) -> ()
typealias examQuestionCompletionHandler = (Exam?) -> ()
