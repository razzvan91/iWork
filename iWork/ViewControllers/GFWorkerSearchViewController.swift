
//
//  GFWorkerSearchViewController.swift
//  iWork
//
//  Created by Razvan Armeanu on 13/06/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import UIKit

class GFWorkerSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //for testitng - set property to 0
    var testing : Bool = true
    let modelTest = GFWorkerDataModel()
    
    @IBOutlet weak var tableView: UITableView!
    var dataBase: GFDatabaseManager = GFDatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "GFWorkerCellTableViewCell", bundle: nil), forCellReuseIdentifier: "workerCell")
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        //for testing
//        if testing{
//            dataBase.getData(fromCollection: "users", andDocument: "pH4VhaeL3HWVY1zhlufQ", completionBlock: )
//            
//            modelTest.name = "Gicu"
//            modelTest.experience = 5
//            modelTest.hourlyRate = 5
//        }
        
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Dismissed")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workerCell", for: indexPath) as! GFWorkerCellTableViewCell
        cell.setCellData(withModel: modelTest)
        return cell;
    }
    
    
    
}
