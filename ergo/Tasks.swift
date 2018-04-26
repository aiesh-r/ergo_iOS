//
//  Tasks.swift
//  ergo
//
//  Created by Ishani Rangana on 1/14/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Tasks : UIViewController{
    
    
    @IBOutlet weak var TaskTable: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var taskNameArray = [String]()
    var resultTaskJSON :[String?] = []
    var taskObjArray:[TaskModel] = []
    let taskURL = "https://kinna.000webhostapp.com/api/v1/iosUserTasks"
    let userIdd = UserDefaults.standard.value(forKey:"userid")
    var newTask: TaskModel?
    
    let parameters1 : Parameters = [
        
       "userid": "\(String(describing: UserDefaults.standard.value(forKey:"userid")!))"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.target = self.revealViewController()
        backButton.action = #selector(SWRevealViewController.revealToggle(_:));
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        TaskTable.delegate = self
        TaskTable.dataSource = self
        
        Alamofire.request(taskURL,method:.post, parameters:parameters1).responseJSON{
            (response) in
            
            let result = response.result
            print(result)
            
            let resultArr = JSON(response.value as Any)
            print(resultArr[0]["name"])
            
            for ind in 0..<resultArr.count{
                let name = resultArr[ind]["name"].string
                self.resultTaskJSON.append(name)
                
                self.newTask = TaskModel()
                
                self.newTask?.name = resultArr[ind]["name"].stringValue
                self.newTask?.description = resultArr[ind]["description"].stringValue
                self.newTask?.assined_user_name = resultArr[ind]["assigned_user_name"].stringValue
                self.newTask?.end_date = resultArr[ind]["end_date"].stringValue
                self.newTask?.start_date = resultArr[ind]["start_date"].stringValue
                self.newTask?.status = resultArr[ind]["status"].stringValue
                
                self.taskObjArray.append(self.newTask!)
                
            }
            
            //print(self.taskObjArray[0])
            self.TaskTable.reloadData()
            
        }
    }
}

extension Tasks: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == TaskTable{
            return self.resultTaskJSON.count
        }
        return self.resultTaskJSON.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as? Cell1TableViewCell
        
        // cell?.cellView.layer.cornerRadius = (cell?.cellView.frame.height)! / 2
        //let projects = self.resultJSON[indexPath.row]
        //cell?.projectName.text = name as? String
        cell1?.taskTitle.text = self.resultTaskJSON[indexPath.row]
        cell1?.taskImage.layer.cornerRadius = (cell1?.taskImage.frame.height)! / 2
        if tableView == TaskTable{
            return cell1!
        }
        return cell1!
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)->CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "TaskDetailViewController") as! TaskDetailViewController
        taskDetailVC.model2 = self.newTask
        self.navigationController?.pushViewController(taskDetailVC, animated: true)
    }
}
