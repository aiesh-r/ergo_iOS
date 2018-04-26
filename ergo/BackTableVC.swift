//
//  BackTableVC.swift
//  ergo
//
//  Created by Ishani Rangana on 12/22/17.
//  Copyright © 2017 IshaniRangana. All rights reserved.
//

import Foundation
import MessageUI


class BackTableVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    
    var TableArray = [String]()
   
    override func viewDidLoad() {
        TableArray = ["DashBoard","Projects","Tasks","Milestones","Events","About","FeedBack","Exit"]
    }
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int{
        return TableArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableArray[indexPath.row], for: indexPath )
        cell.textLabel?.text = TableArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      //getting the index path of the selected raw
      let indexPath = tableView.indexPathForSelectedRow
      //getting the current cell which is selected
      let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
      //getting the text of that cell
      let currentItem = currentCell.textLabel!.text
        
        //to display alert to confirm exit
        if (currentItem == "Exit"){
            
            let myAlert = UIAlertController(title:"Exit", message:"Are You Sure You Want to Exit From Ergo?", preferredStyle:UIAlertControllerStyle.alert)
            
            let yes = UIAlertAction(title:"yes", style:UIAlertActionStyle.default)
            {(action) in
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier:
                    "loginViewController") as! loginViewController
                //let navController = UINavigationController(rootViewController: profileViewController)
                let dest = loginViewController
                self.present(dest, animated: true, completion: nil)
                //self.navigationController?.pushViewController(profileViewController, animated: true)
            }
            let no = UIAlertAction(title:"no", style:UIAlertActionStyle.default);
            myAlert.addAction(yes)
            myAlert.addAction(no)
            self.present(myAlert, animated:true, completion:nil);
            
        }
        //to send email in feedback
        if (currentItem == "FeedBack"){
            let emailViewController = configuredMailComposerViewController()
            if MFMailComposeViewController.canSendMail(){
                self.present(emailViewController, animated: true, completion: nil)
            }else{
                self.showMailSendingErrorAlert()
            }
        }
        
    }
    
    
    func configuredMailComposerViewController() ->MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["ishani.rangana123@gmail.com"])
        mailComposerVC.setSubject("Send FeedBack")
        mailComposerVC.setMessageBody("Hi,Team:Techknights\n\nI would like to share following feedback with you.\n ", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailSendingErrorAlert(){
      let emailErrorAlert = UIAlertController(title:"Error!Could not send email.", message:"Your device not supports to send email.Please check email configuration of your phone and try again!", preferredStyle:UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default)
        emailErrorAlert.addAction(ok)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
      /*  if (result == MFMailComposeResult.cancelled){
            self.dismiss(animated: true, completion: nil)
        }else if(result == MFMailComposeResult.sent){
            let emailSent = UIAlertController(title:"Sent", message:"Your feedBack Sent Successfully!", preferredStyle:UIAlertControllerStyle.alert)
            
            let ok = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default)
            emailSent.addAction(ok)
        }else{
             self.dismiss(animated: true, completion: nil)
         }*/
        
       
     switch result.rawValue {
     
        case MFMailComposeResult.cancelled.rawValue :
            print("email cancelled")
        
        case MFMailComposeResult.sent.rawValue :
            print("email sent")
        
        case MFMailComposeResult.saved.rawValue :
            print("saved")
     
        case MFMailComposeResult.failed.rawValue :
            print("failed")
     
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    
       /* switch result {
            
        case MFMailComposeResult.cancelled :
            print("email cancelled")
            
        case MFMailComposeResult.sent :
            print("email sent")
            
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
        */
    
    }
    
}
