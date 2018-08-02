//
//  GFDatabaseManager.swift
//  iWork
//
//  Created by Razvan Armeanu on 15/06/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class GFDatabaseManager: NSObject {
    
    var db: Firestore!
    
    override init() {
        super.init()
        db = Firestore.firestore()
    }
  
    
    //MARK: fetching the data
    func getData(fromCollection collection: String, andDocument document: String, completionBlock: @escaping (GFWorkerDataModel) -> Void){
        let docRef = db.collection(collection).document(document)
        docRef.getDocument { (document, error) in
            if (error != nil) {
                print("Document does not exist!")
            } else {
                if let document = document, document.exists {
                    let worker = GFWorkerDataModel()
                    worker.name = document.get("profession") as! String
                    //TODO: Introduce 
                    completionBlock(worker)
                }
            }
        }
    }

}
