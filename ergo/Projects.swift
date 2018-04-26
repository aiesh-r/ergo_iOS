//
//  Projects.swift
//  ergo
//
//  Created by Ishani Rangana on 1/14/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class Projects : UIViewController {
   
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
  //  let defaultValues = UserDefaults.standard
    
    var projectNameArry = [String]()
    var resultJSON: [String?] = []
    var projectObjArray:[ProjectModel] = []
    let project_url = "https://kinna.000webhostapp.com/api/v1/iosUserProjects"
    let userIdd = UserDefaults.standard.value(forKey:"userid")
    var newProject: ProjectModel?
    var valueToPass:String!
    
    let parameters : Parameters = [
        "userid": "\(String(describing: UserDefaults.standard.value(forKey:"userid")!))"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.target = self.revealViewController()
        backButton.action = #selector(SWRevealViewController.revealToggle(_:));
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
        //\(String(describing: userIdd))
        //get request to obtain project names from db
        Alamofire.request(project_url,method:.post, parameters:parameters).responseJSON{
            (response) in
            
            
            let result = response.result
            print(result)
            
            let resultFormatter = JSON(response.value as Any)
            
            
            for ind in 0..<resultFormatter.count{
                let name = resultFormatter[ind]["name"].string
                self.resultJSON.append(name)
                
                self.newProject = ProjectModel()
                
                self.newProject?.category = resultFormatter[ind]["category"].stringValue
                self.newProject?.description = resultFormatter[ind]["description"].stringValue
                self.newProject?.company_id = resultFormatter[ind]["company_id"].intValue
                self.newProject?.created_at = resultFormatter[ind]["created_at"].stringValue
                self.newProject?.end_date = resultFormatter[ind]["end_date"].stringValue
                self.newProject?.id = resultFormatter[ind]["id"].intValue
                self.newProject?.name = resultFormatter[ind]["name"].stringValue
                self.newProject?.start_date = resultFormatter[ind]["start_date"].stringValue
                self.newProject?.updated_at = resultFormatter[ind]["updated_at"].stringValue
                self.projectObjArray.append(self.newProject!)
           
                
            }
          //  print(self.newProject)
            self.TableView.reloadData()
            
            
        }
    }
    
}


extension Projects: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == TableView{
            return self.resultJSON.count
        }
        return self.resultJSON.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)->CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCellTableViewCell
        
        // cell?.cellView.layer.cornerRadius = (cell?.cellView.frame.height)! / 2
        //let projects = self.resultJSON[indexPath.row]
        //cell?.projectName.text = name as? String
        cell?.projectName.text = self.resultJSON[indexPath.row]
        cell?.projectImage.layer.cornerRadius = (cell?.projectImage.frame.height)! / 2
        if tableView == TableView {
            return cell!
        }
        return cell!
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProjectDetailsViewController") as! ProjectDetailsViewController
        vc.model = self.newProject
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

