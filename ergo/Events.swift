//
//  Events.swift
//  ergo
//
//  Created by Ishani Rangana on 1/14/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Events : UIViewController{
    
    @IBOutlet weak var eventsTable: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
   
        var eventsArray = [String]()
        var resultEventJson:[String?] = []
        var eventObjArray:[EventsModel] = []
        var event_URL = "https://kinna.000webhostapp.com/api/v1/iosCompanyEvents"
        let companyIdd = UserDefaults.standard.value(forKey:"company_id")
        var newEvents:EventsModel?
 
        let parameters:Parameters = [
       
            "company_id":"\(String(describing: UserDefaults.standard.value(forKey:"company_id")!))"
        ]
    
    
         
    override func viewDidLoad() {
        super.viewDidLoad()
       
        backButton.target = self.revealViewController()
        backButton.action =
        #selector(SWRevealViewController.revealToggle(_:));
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        eventsTable.delegate = self
        eventsTable.dataSource = self
    
        Alamofire.request(event_URL,method:.post,parameters:parameters).responseJSON{
            
            (response) in
            
            let result = response.result
            print(result)
            
            let eventsresultsArray = JSON(response.value as Any)
            print(eventsresultsArray[0]["name"])
            
            for ind in 0..<eventsresultsArray.count{
                let name = eventsresultsArray[ind]["name"].string
                self.resultEventJson.append(name)
                
                self.newEvents = EventsModel()
                
                self.newEvents?.name = eventsresultsArray[ind]["name"].stringValue
                self.newEvents?.description = eventsresultsArray[ind]["description"].stringValue
                self.newEvents?.start_date = eventsresultsArray[ind]["start_date"].stringValue
                self.newEvents?.end_date = eventsresultsArray[ind]["end_date"].stringValue
                self.newEvents?.event_created_by = eventsresultsArray[ind]["event_created_by"].stringValue
                self.eventObjArray.append(self.newEvents!)
            }
           print(self.eventObjArray[0])
            self.eventsTable.reloadData()
        }
    
    }
}

extension Events: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == eventsTable{
            return self.resultEventJson.count
        }
        return self.resultEventJson.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)->CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? CellEventsTableViewCell
        
        
        eventCell?.eventTitle.text = self.resultEventJson[indexPath.row]
        eventCell?.eventImage.layer.cornerRadius = (eventCell?.eventImage.frame.height)! / 2
        if tableView == eventsTable{
            return eventCell!
        }
        return eventCell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        eventsDetailVC.model4 = self.newEvents
        self.navigationController?.pushViewController(eventsDetailVC, animated: true)
        
    }
    
    
    
}








