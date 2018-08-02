//
//  GFLoginViewController.swift
//  iWork
//
//  Created by Razvan Armeanu on 05/06/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import UIKit
import Firebase

class GFLoginViewController: UIViewController {

    var loginCoordinator: GFLoginCoordinator?

    override func viewDidLoad() {
        if Auth.auth().currentUser == nil {
            loginCoordinator = GFLoginCoordinator(rootViewController: self)
        }
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            loginCoordinator = nil
        }
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        loginCoordinator?.start()
        super.viewDidAppear(animated)
    }
    @IBAction func searchForWorkerButton(_ sender: Any) {
//        performSegue(withIdentifier: "workerSearchSegue", sender: sender);
    }
    
}

