//
//  PeriodTableViewCell.swift
//  Overseer
//
//  Created by Joshua Fan on 10/20/20.
//  Copyright © 2020 joshuafan. All rights reserved.
//

import UIKit

// determines layout for each individual period cell in main menu
class PeriodTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
