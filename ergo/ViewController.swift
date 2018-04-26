//
//  ViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 12/16/17.
//  Copyright © 2017 IshaniRangana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //switching the screen
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }



}

