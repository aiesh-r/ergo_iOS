//
//  MilestoneDetailsViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/23/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit

class MilestoneDetailsViewController: UIViewController {

    @IBOutlet weak var milestoneDetail: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    var model3 : MilestoneModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        milestoneDetail.text = model3?.description
        startDate.text = model3?.start_date
        endDate.text = model3?.end_date
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
