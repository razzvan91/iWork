//
//  GFViewController.swift
//  iWork
//
//  Created by Razvan Armeanu on 05/06/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import UIKit

class GFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        (UIApplication.shared.delegate as! AppDelegate).loginCoordinator?.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

