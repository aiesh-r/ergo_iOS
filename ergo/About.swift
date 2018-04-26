//
//  About.swift
//  ergo
//
//  Created by Ishani Rangana on 1/27/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import Foundation
class About : UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    override func viewDidLoad() {
        backButton.target = self.revealViewController()
        backButton.action =
            #selector(SWRevealViewController.revealToggle(_:));
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    
    
    
}
