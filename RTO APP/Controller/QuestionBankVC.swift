//
//  QuestionBankVC.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import Kingfisher

class QuestionBankVC: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var textQuestionArray = TextQuestion()
    var imageQuestionArray = ImageQuestion()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        segment.setupSegmentControl()
        getImageData()
        getTextData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @IBAction func segmentControllerTapped(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    

}

// MARK: API Calls Go Here

extension QuestionBankVC {
    
    func getTextData() {
        
        QuestionsService.instance.getTextQuestionData(url: TEXT_QUESTION_URL) { (textQuestionData) in
            
            if let textQuestions = textQuestionData {
                
                self.textQuestionArray = textQuestions
                
            }
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    
    func getImageData() {
        
        QuestionsService.instance.getImageQuestionData(url: IMAGE_QUESTION_URL) { (imageJsonData) in
            
            if let imageQuestions = imageJsonData {
                
                self.imageQuestionArray = imageQuestions
            }
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
            
        }
        
    }
    
}

extension QuestionBankVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segment.selectedSegmentIndex == 0 {
            return textQuestionArray.count
        } else {
            return imageQuestionArray.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segment.selectedSegmentIndex == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextQuestionCell") as? TextQuestionCell else {return UITableViewCell()}
            
            let textData = textQuestionArray[indexPath.row]
            cell.questionLbl.text = textData.question
            cell.answerLbl.text = textData.answer
            
            return cell
            
        } else {
            
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageQuestionCell") as? ImageQuestionCell else {return UITableViewCell()}
            
            let imageData = imageQuestionArray[indexPath.row]
            
            let imageUrl = URL(string: imageData.image)
            
            cell.signalImage.kf.setImage(with: imageUrl)
            cell.signalLabel.text = imageData.name
    
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if segment.selectedSegmentIndex == 0 {
            return UITableView.automaticDimension
        } else {
            return 250
        }
        
    }
    
    
    
}
