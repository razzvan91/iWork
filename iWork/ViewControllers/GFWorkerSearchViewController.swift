
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
    var workers = [GFWorkerDataModel]()
    
    @IBOutlet weak var tableView: UITableView!
    var dataBase: GFDatabaseManager = GFDatabaseManager()
    var workersArray = [GFWorkerDataModel]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "GFWorkerCellTableViewCell", bundle: nil), forCellReuseIdentifier: "workerCell")
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        //for testing
        if testing {
            dataBase.getData(fromCollection: "users", andDocument: "pH4VhaeL3HWVY1zhlufQ") {
                worker in
                self.workersArray.append(worker)
                DispatchQueue.main.async {
                    // Run UI Updates or call completion block
                    self.tableView.reloadData()
                }
            }
        }

    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Dismissed")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workersArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workerCell", for: indexPath) as! GFWorkerCellTableViewCell
        cell.setCellData(withModel: workersArray[indexPath.row])
        return cell;
    }
    
    
    
}
