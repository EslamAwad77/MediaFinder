//
//  LoginExtensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//

import Foundation
import UIKit


extension LoginVC {
    
     func goToProfile(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MediaListVC") as! MediaListVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
//     func isDataEntered() -> Bool {
//        if let email = txtFieldEmail.text, let password = txtFieldPassword.text, email == self.email, password == self.password {
//            if email != "" && password != "" {
//                return true
//                // profileVC.name = self.name
//                // profileVC.email = self.email
//                // profileVC.password = self.password
//                // profileVC.phone = self.phone
//                // profileVC.address = self.address
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
//    }
    
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
        guard invalidEmail(txtFieldEmail.text!)! else {
            self.showAlert(message: "please enter valid email")
            return false
        }
        guard invalidPassword(txtFieldPassword.text!)! else {
            self.showAlert(message: "please enter valid password")
            return false
        }
        
        return true
    }
    
     func loginTapped(){
        if isDataEntered(){
            if isDataValid(){
                goToProfile()
            }
        }
    }
}
