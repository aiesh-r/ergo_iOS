//
//  ProjectDetailsViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/22/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {
    

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var createDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    var model : ProjectModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        category.text = model?.category
        descript.text = model?.description
        createDate.text = model?.start_date
        endDate.text = model?.end_date
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
}

