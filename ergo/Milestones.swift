//
//  Milestones.swift
//  ergo
//
//  Created by Ishani Rangana on 1/14/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Milestones : UIViewController{
    
    @IBOutlet weak var MilestoneTable: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var milestoneArray = [String]()
    var resultMilestoneJSON: [String?] = []
    var milestoneObjArray:[MilestoneModel] = []
    let milestoneURL = "https://kinna.000webhostapp.com/api/v1/iosUserMilestones"
    let userIdd = UserDefaults.standard.value(forKey:"userid")
    var newMilestone: MilestoneModel?
    
    let parameters : Parameters = [
        
       "userid": "\(String(describing: UserDefaults.standard.value(forKey:"userid")!))"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.target = self.revealViewController()
        backButton.action = #selector(SWRevealViewController.revealToggle(_:));
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        MilestoneTable.delegate = self
        MilestoneTable.dataSource = self
        
        Alamofire.request(milestoneURL,method:.post,parameters:parameters).responseJSON{
            
            (response) in
            
            let result = response.result
            print(result)
            
            let milestoneresultArr = JSON(response.value as Any)
            
            for ind in 0..<milestoneresultArr.count{
                let description = milestoneresultArr[ind]["description"].string
                self.resultMilestoneJSON.append(description)
                
                self.newMilestone = MilestoneModel()
                
                self.newMilestone?.description = milestoneresultArr[ind]["description"].stringValue
                self.newMilestone?.start_date = milestoneresultArr[ind]["start_date"].stringValue
                self.newMilestone?.end_date = milestoneresultArr[ind]["end_date"].stringValue
                
                
                self.milestoneObjArray.append(self.newMilestone!)
                
            }
            //print("-----------------------------")
            //print(self.milestoneObjArray[0])
            self.MilestoneTable.reloadData()
            
            
        }
    }
}

extension Milestones: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == MilestoneTable{
            return self.resultMilestoneJSON.count
        }
        return self.resultMilestoneJSON.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)->CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? CellMilestoneTableViewCell
        
        // cell?.cellView.layer.cornerRadius = (cell?.cellView.frame.height)! / 2
        //let projects = self.resultJSON[indexPath.row]
        //cell?.projectName.text = name as? String
        cell2?.milestoneTitle.text = self.resultMilestoneJSON[indexPath.row]
        cell2?.milestoneImage.layer.cornerRadius = (cell2?.milestoneImage.frame.height)! / 2
        if tableView == MilestoneTable{
            return cell2!
        }
        return cell2!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let milestoneDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "MilestoneDetailsViewController") as! MilestoneDetailsViewController
        milestoneDetailVC.model3 = self.newMilestone
        self.navigationController?.pushViewController(milestoneDetailVC, animated: true)
    }
    
    
    
}







