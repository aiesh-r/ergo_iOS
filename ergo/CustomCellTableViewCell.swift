//
//  CustomCellTableViewCell.swift
//  ergo
//
//  Created by Ishani Rangana on 1/17/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectName: UILabel!
   
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
