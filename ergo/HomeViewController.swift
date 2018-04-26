//
//  HomeViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 12/21/17.
//  Copyright © 2017 IshaniRangana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
       super.viewDidLoad()
       menuButton.target = self.revealViewController()
       menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
       self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer());
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //menu button tapped
    @IBAction func openMenuScreen(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        if (buttonTitle == "Exit"){
            let myAlert = UIAlertController(title:"Exit", message:"Are You Sure You Want to Exit From Ergo?", preferredStyle:UIAlertControllerStyle.alert)
             
            let yes = UIAlertAction(title:"yes", style:UIAlertActionStyle.default)
             {(action) in
              /*self.revealViewController().rearViewController.performSegue(withIdentifier: buttonTitle, sender: self.revealViewController().rearViewController)*/
                
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier:
                    "loginViewController") as! loginViewController
                
                let destVC = loginViewController
                self.present(destVC, animated: true, completion: nil)
             }
            let no = UIAlertAction(title:"no", style:UIAlertActionStyle.default);
            
             
             myAlert.addAction(yes)
             myAlert.addAction(no)
             self.present(myAlert, animated:true, completion:nil);
            
            
        }else{
             
            self.revealViewController().rearViewController.performSegue(withIdentifier: buttonTitle, sender: self.revealViewController().rearViewController)
        }
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destVC:HomeViewController = segue.destination as! HomeViewController
    }
    
  

}
