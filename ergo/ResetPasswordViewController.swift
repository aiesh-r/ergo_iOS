//
//  ResetPasswordViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/29/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var passwordType1: UITextField!
    @IBOutlet weak var passwordType2: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    let URL_changePassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        let parameters: Parameters=[
           "password1":passwordType1.text!,
           "repeatPassword":passwordType2.text!
        ]
        
        let userPassword = passwordType1.text;
        let userRepeatPassword = passwordType2.text;
        
        //check if password match
        if(userPassword != userRepeatPassword){
            
            diplayMyAlertMessage(userMessage: "Passwords do not match!");
            return;
        }
        
        
        //Sending http post request
        Alamofire.request(URL_changePassword, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    self.messageLabel.text = jsonData.value(forKey: "message") as! String?
                    
                    
                    //displaying the message in label
                    
                    let loginViewController = self.storyboard?.instantiateViewController(withIdentifier:
                        "loginViewController") as! loginViewController
                    let navController = UINavigationController(rootViewController: loginViewController)
                    self.present(navController, animated: false, completion: nil)
                }else{
                   
                }
        }
        
    }
    
    func diplayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
