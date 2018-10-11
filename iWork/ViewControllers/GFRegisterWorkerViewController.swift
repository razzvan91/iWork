//
//  GFRegisterWorkerViewController.swift
//  iWork
//
//  Created by Razvan Armeanu on 05/08/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import UIKit
import Firebase

class GFRegisterWorkerViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var averageCostTextField: UITextField!
    @IBOutlet weak var experienceTextField: UITextField!
    @IBOutlet weak var availableForEmergencyTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    @IBOutlet weak var responseTimeTextField: UITextField!
    @IBOutlet weak var workingHoursTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        let wh = Firestore.firestore().collection("workingHours").addDocument(data: [
            "hours": workingHoursTextField.text!
            ]
        )
        
        Firestore.firestore().collection("users").addDocument(data: [
            "averageCost": Int(averageCostTextField.text!)!,
            "experiece": Int(experienceTextField.text!)!,
            "isEmergency": availableForEmergencyTextField.text == "true",
            "profession": professionTextField.text!,
            "responseTime": Int(responseTimeTextField.text!)!,
            "userID": Auth.auth().currentUser!.uid,
            "workingHours": wh
        ]) { (error) in
            guard nil == error else {
                print(error!.localizedDescription)
                return
            }
            print("user added")
        }
    }
    

}
