//
//  loginViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 12/16/17.
//  Copyright © 2017 IshaniRangana. All rights reserved.
//

import UIKit
import Alamofire

class loginViewController: UIViewController, UITextFieldDelegate{

    
    let URL_USER_LOGIN = "https://kinna.000webhostapp.com/api/iosLogin"
    
    //the defaultvalues to store user data
    //let defaultValues = UserDefaults.standard

    @IBOutlet weak var textLabelMessage: UILabel!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabelMessage.isHidden = true
        //to hide key board
        textEmail.delegate = self
        textPassword.delegate = self
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //if textEmail.text != nil && textPassword.text != nil{
            
       // }
        let email = textEmail.text!
        let password = textPassword.text!
        let finalEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if finalEmail.isEmpty && password.isEmpty {
            textLabelMessage.isHidden = false
            textLabelMessage.text = "Please enter your email and password!"
        }else if finalEmail.isEmpty{
            textLabelMessage.isHidden = false
            self.textLabelMessage.text = "Please enter your email!"
        }else if password.isEmpty{
            textLabelMessage.isHidden = false
            self.textLabelMessage.text = "Please enter your password!"
        }else if isValideEmail(email: finalEmail) == false{
                textLabelMessage.isHidden = false
                self.textLabelMessage.text = "Please enter valid email!"
        }else{
        
        //get email and password
        let parameters:Parameters=[
            "email":finalEmail,
            "password":password
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {(response) in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                    
                        //getting user values
                        let userName = user.value(forKey: "name") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userCategory = user.value(forKey: "user_type") as! String
                        let userId = user.value(forKey: "userid") as! String
                        let companyId = user.value(forKey: "company_id") as! String
                        
                        //saving user values to defaults
                        UserDefaults.standard.set(userName, forKey: "name")
                        UserDefaults.standard.set(userEmail, forKey: "email")
                        UserDefaults.standard.set(userCategory, forKey: "user_type")
                        UserDefaults.standard.set(userId, forKey: "userid")
                        UserDefaults.standard.set(companyId, forKey: "company_id")
                        //self.defaultValues.set(userId, forKey: "userid")
                        
                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
                            "ProfileViewController") as! ProfileViewController
                        let navController = UINavigationController(rootViewController: profileViewController)
                        self.present(navController, animated: false, completion: nil)
                        //self.navigationController?.pushViewController(profileViewController, animated: true)
                        
                       //self.dismiss(animated: true, completion: nil)
                    }else{
                        //error message in case of invalid credential
                        self.textLabelMessage.isHidden = false
                        self.textLabelMessage.text = jsonData.value(forKey: "message") as? String
                    }
                }
             }
        }
    }
    func isValideEmail(email:String)->Bool{
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9>-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with:email)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textEmail{
            textPassword.becomeFirstResponder()
        }else if textField == textPassword{
            textField.resignFirstResponder()
        }
        return true
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
