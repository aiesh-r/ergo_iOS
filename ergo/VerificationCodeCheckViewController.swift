//
//  VerificationCodeCheckViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/29/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class VerificationCodeCheckViewController: UIViewController {

    @IBOutlet weak var verificationText: UITextField!
    @IBOutlet weak var messageValidate: UILabel!
    
    
    let URL_verificationCode = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        let parameters:Parameters=[
            "code":verificationText.text!
           
        ]
        Alamofire.request(URL_verificationCode, method:.post,parameters:parameters).responseJSON {
            (response) in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                if(!(jsonData.value(forKey: "error") as! Bool)){
                    
                    //displaying the message in label
                    self.messageValidate.text = jsonData.value(forKey: "message") as! String?
                    let ResetPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier:
                        "ResetPasswordViewController") as! ResetPasswordViewController
                    let navController = UINavigationController(rootViewController: ResetPasswordViewController)
                    self.present(navController, animated: false, completion: nil)
                }
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

 

}
