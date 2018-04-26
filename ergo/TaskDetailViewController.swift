//
//  TaskDetailViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/23/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskAssignedName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    var model2: TaskModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = model2?.name
        taskAssignedName.text = model2?.assined_user_name
        descriptionLabel.text = model2?.description
        statusLabel.text = model2?.status
        startDate.text = model2?.start_date
        endDate.text = model2?.end_date
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
