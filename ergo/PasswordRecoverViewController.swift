//
//  PasswordRecoverViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/29/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class PasswordRecoverViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var messageText: UILabel!
    
    let URL_recover = "https://kinna.000webhostapp.com/api/checkEmail"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        
      
            //get email
            let parameters:Parameters=[
                "email":emailText.text!
                
            ]
            
            //making a post request
            Alamofire.request(URL_recover, method: .post, parameters: parameters).responseJSON
                {
                    response in
                    
                    print(response)
                    
                    //getting the json value from the server
                    if let result = response.result.value {
                        let jsonData = result as! NSDictionary
                        
                        //if there is no error
                        if(!(jsonData.value(forKey: "error") as! Bool)){
                            
                            let VerificationCodeCheckViewController = self.storyboard?.instantiateViewController(withIdentifier:
                                "VerificationCodeCheckViewController") as! VerificationCodeCheckViewController
                            let navController = UINavigationController(rootViewController: VerificationCodeCheckViewController)
                            self.present(navController, animated: false, completion: nil)
                            //self.navigationController?.pushViewController(profileViewController, animated: true)
                        }
                        else
                        {
                            print(jsonData.value(forKey: "message")!)
                            print("error occured!")
                            self.messageText.text = (jsonData.value(forKey: "message") as! String)
                            //error message in case of invalid credential
                            //self.textLabelMessage.text = "Invalid username or password"
                        }
                    }
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    

}
