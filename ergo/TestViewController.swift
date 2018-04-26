//
//  TestViewController.swift
//  ergo
//
//  Created by Ishani Rangana on 1/21/18.
//  Copyright © 2018 IshaniRangana. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON


class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var projectNameArry = [String]()
    var resultJSON: [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UINib(nibName: "ProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectTableViewCell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 30

        Alamofire.request("https://kinna.000webhostapp.com/api/v1/projects").responseJSON{
            (response) in
            
            var result = response.result
            
            let resultFormatter = JSON(response.value!)
            
            for ind in 0..<resultFormatter.count{
                let name = resultFormatter[ind]["name"].string
                self.resultJSON.append(name)
            }
            
            print(self.resultJSON)
            self.tableView.reloadData()
        }
    }

}

extension TestViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultJSON.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell", for: indexPath) as! ProjectTableViewCell
        cell.nameLabel.text = self.resultJSON[indexPath.row]
        return cell
    }
}
