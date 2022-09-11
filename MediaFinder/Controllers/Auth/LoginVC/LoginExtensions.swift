//
//  LoginExtensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//

import Foundation
import UIKit


extension LoginVC {
    func goToMedia(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MediaListVC") as! MediaListVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func isDataEntered() -> Bool {
        guard let email = txtFieldEmail.text , email != "" else {
            self.showAlert(message: "please enter your valid email")
            return false
        }
        guard let password = txtFieldPassword.text , password != "" else {
            self.showAlert(message: "please enter your valid password")
            return false
        }
        return true
    }
    
    func isDataValid() -> Bool {
        guard ValidationManager.singleton.invalidEmail(txtFieldEmail.text!)! else {
            self.showAlert(message: "please enter valid email")
            return false
        }
        guard ValidationManager.singleton.invalidPassword(txtFieldPassword.text!)! else {
            self.showAlert(message: "please enter valid password")
            return false
        }
        
        return true
    }
    
    func matchingData(email: String, password: String) -> Bool {
        guard (email == txtFieldEmail.text) else {
            self.showAlert(message: "wrong email entered")
            return false
        }
        guard (password == txtFieldPassword.text) else {
            self.showAlert(message: "wrong password entered")
            return false
        }
        return true
    }
    
    func loginTapped(){
        if isDataEntered(){
            if isDataValid(){
                if let user = SQlManager.sharedObject().getUserData(email: txtFieldEmail.text!) {
                    if matchingData(email: txtFieldEmail.text!, password: user.password) {
                        UserDefaultsManager.shared().email = txtFieldEmail.text!
                        goToMedia()
                    }
                }
            }
        }
    }
}
