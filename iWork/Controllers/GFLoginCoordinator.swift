//
//  GFLoginCoordinator.swift
//  iWork
//
//  Created by Mihai Radu on 08/06/2018.
//  Copyright © 2018 Razvan. All rights reserved.
//

import ILLoginKit
import FirebaseAuth

class GFLoginCoordinator: LoginCoordinator {

    override func login(email: String, password: String) {
        finish()
    }

    override func signup(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard nil == error else {
                let alertController = UIAlertController(title: "", message: error?.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.window?.rootViewController?.present(alertController, animated: true)
                return
            }
            self.finish()
        }
    }

    override func enterWithFacebook(profile: FacebookProfile) {
        finish()
    }

    override func recoverPassword(email: String) {

    }

}
