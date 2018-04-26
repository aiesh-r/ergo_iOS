//
//  registerViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 12/16/17.
//  Copyright © 2017 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class registerViewController: UIViewController {

    let URL_USER_REGISTER = "https://crushing-skin.000webhostapp.com/v1/register.php"
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPhoneNumber: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var textRepeatPassword: UITextField!
    
    @IBAction func registerBittonTapped(_ sender: UIButton) {
        let parameters: Parameters=[
            "username":textUserName.text!,
            "email":textEmail.text!,
            "phone":textPhoneNumber.text!,
            "password":textPassword.text!
        ]
        let userPassword = textPassword.text;
        let userRepeatPassword = textRepeatPassword.text;
        
        //check if password match
        if(userPassword != userRepeatPassword){
            
            diplayMyAlertMessage(userMessage: "Passwords do not match!");
            return;
        }
        
        //display alert message
        let myAlert = UIAlertController(title:"Alert", message:"Registration is successful,Thank you!", preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"ok", style:UIAlertActionStyle.default)
        {action in
            self.dismiss(animated:true, completion:nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
            }
    }
   
    @IBAction func existloginButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func diplayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
