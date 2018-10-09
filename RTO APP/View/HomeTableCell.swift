//
//  HomeTableCell.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 09/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryDescription: UILabel!
    
    
    func configureView(category: Category) {
        
        self.categoryImage.image = UIImage(named: category.categoryImage)
        self.categoryName.text = category.categoryName
        self.categoryDescription.text = category.categoryDescription
    }

}
