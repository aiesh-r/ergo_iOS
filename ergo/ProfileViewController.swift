//
//  ProfileViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 12/17/17.
//  Copyright © 2017 IshaniRangana. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var textUserNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        //hiding back button
       let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //getting user data from defaults
        //let defaultValues = UserDefaults.standard
        if let name = UserDefaults.standard.string(forKey: "name"){
            
            //setting the name to label
            textUserNameLabel.text = name
            
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
