//
//  CellEventsTableViewCell.swift
//  ergo
//
//  Created by Ishani Rangana on 1/26/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class CellEventsTableViewCell: UITableViewCell {
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
