//
//  CellMilestoneTableViewCell.swift
//  ergo
//
//  Created by Ishani Rangana on 1/23/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class CellMilestoneTableViewCell: UITableViewCell {

    @IBOutlet weak var milestoneTitle: UILabel!
    @IBOutlet weak var milestoneImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
