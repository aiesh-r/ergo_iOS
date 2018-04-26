//
//  EventDetailsViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/26/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {

    @IBOutlet weak var eventDetails: UILabel!
 
    @IBOutlet weak var startDate: UILabel!
   
    @IBOutlet weak var endDate: UILabel!
    
    @IBOutlet weak var createdBy: UILabel!
    
    
    var model4:EventsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventDetails.text = model4?.description
        startDate.text = model4?.start_date
        endDate.text = model4?.end_date
        createdBy.text = model4?.event_created_by
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
