
//
//  GFWorkerSearchViewController.swift
//  iWork
//
//  Created by Razvan Armeanu on 13/06/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import UIKit

class GFWorkerSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "GFWorkerCellTableViewCell", bundle: nil), forCellReuseIdentifier: "workerCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func bk(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Dismissed")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "workerCell", for: indexPath)

        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;
    }


}
