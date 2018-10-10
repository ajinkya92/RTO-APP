//
//  SettingCell.swift
//  RTO APP
//
//  Created by Ajinkya Sonar on 10/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView(settings: Settings) {
        
        self.iconImage.image = UIImage(named: settings.iconImage)
        self.name.text = settings.name
    }

}
