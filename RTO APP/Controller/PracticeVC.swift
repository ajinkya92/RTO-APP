//
//  PracticeVC.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class PracticeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    var practiceData = Practice()
    
    var createdRowIndexpath: Int!
    var currentQuestion = 1
    
    // Answer Checking Variables
    
    var shouldSelectRightAnswer = false
    var rightAnswer = String()
    var selectedAnswer: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        getData()
        previousButton.isHidden = true
        createdRowIndexpath = 0
        
    }
    
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        
        var indexpath = IndexPath(row: createdRowIndexpath, section: 0)
        
        if indexpath.row >= 0 {
            
            createdRowIndexpath -= 1
            currentQuestion -= 1
            indexpath = IndexPath(row: createdRowIndexpath, section: 0)
            collectionView.scrollToItem(at: indexpath, at: .right, animated: true)
            questionNumberLabel.text = "\(String(describing: currentQuestion))"
        }
        
        
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        var indexpath = IndexPath(row: createdRowIndexpath, section: 0)
        
        if indexpath.row <= practiceData.count - 1 {
            
            createdRowIndexpath += 1
            currentQuestion += 1
            indexpath = IndexPath(row: createdRowIndexpath, section: 0)
            collectionView.scrollToItem(at: indexpath, at: .left, animated: true)
            questionNumberLabel.text = "\(currentQuestion)"
            
        }
        
    }
    
    
    
    
    
}

extension PracticeVC {
    
    func getData() {
        
        PracticeService.instance.getPracticeData(url: PRACTICE_URL) { (practiceJsonData) in
            
            if let data = practiceJsonData {
                
                self.practiceData = data
            }
            
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
    
    
}



extension PracticeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return practiceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PracticeCollectionCell", for: indexPath) as? PracticeCollectionCell else {return UICollectionViewCell()}
        
        cell.tableView.tag = indexPath.row
        
        createdRowIndexpath = cell.tableView.tag
        
        cell.tableView.delegate = nil
        cell.tableView.dataSource = nil
        
        cell.tableView.dataSource = self
        cell.tableView.delegate = self
        
        cell.tableView.reloadData()
        
        previousButton.isHidden = cell.tableView.tag == 0 ? true : false
        nextButton.isHidden = cell.tableView.tag == practiceData.count - 1 ? true: false
        
        currentQuestion = cell.tableView.tag + 1
        questionNumberLabel.text = "\(currentQuestion)"
        
        shouldSelectRightAnswer = false
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: self.collectionView.frame.height)
    }
    
    
}


extension PracticeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let questions = practiceData[tableView.tag]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PracticeQuestionCell") as? PracticeQuestionCell else {return UITableViewCell()}
        
        cell.questionLabel.text = questions.question
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let options = practiceData[tableView.tag]
        rightAnswer = practiceData[tableView.tag].answer
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PracticeOptionCell") as? PracticeOptionCell else {return UITableViewCell()}
        
        if indexPath.row == 0 {
            cell.optionLabel.text = "1.\(options.option1)"
            cell.optionLabel.backgroundColor = UIColor.clear
        } else if indexPath.row == 1 {
            cell.optionLabel.text = "2.\(options.option2)"
            cell.optionLabel.backgroundColor = UIColor.clear
        } else {
            cell.optionLabel.text = "3.\(options.option3)"
            cell.optionLabel.backgroundColor = UIColor.clear
        }
        
        if shouldSelectRightAnswer {
            
            if indexPath.row + 1 == Int(rightAnswer) {
                
                cell.optionLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else if indexPath.row + 1 == selectedAnswer {
                
                cell.optionLabel.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                
            } else {
                
                cell.optionLabel.backgroundColor = UIColor.clear
                
            }
            
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !shouldSelectRightAnswer {
            
            selectedAnswer = indexPath.row
            shouldSelectRightAnswer = true
            tableView.reloadData()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    
}
