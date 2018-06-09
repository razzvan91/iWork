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

//    MARK: -

    override func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard nil == error else {
                self.showAlert(for: error?.localizedDescription)
                return
            }
            self.finish()
        }
    }

    override func signup(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard nil == error else {
                self.showAlert(for: error?.localizedDescription)
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

//    MARK: -

    private func showAlert(for error: String?) {
        let alertController = UIAlertController(title: "", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        rootViewController?.present(alertController, animated: true)
    }

//    MARK: -

}
