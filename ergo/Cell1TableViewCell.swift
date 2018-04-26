//
//  Cell1TableViewCell.swift
//  ergo
//
//  Created by Ishani Rangana on 1/23/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class Cell1TableViewCell: UITableViewCell {

    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
