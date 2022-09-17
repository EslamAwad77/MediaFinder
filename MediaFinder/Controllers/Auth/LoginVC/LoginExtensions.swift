//
//  LoginExtensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//

import UIKit

extension LoginVC {
    
    //MARK:- Public Methods
    func loginTapped(){
        if isDataEntered(){
            if isDataValid(){
                if let user = SQlManager.shared().getUserData(email: txtFieldEmail.text!) {
                    if matchingData(email: txtFieldEmail.text!, password: user.password) {
                        UserDefaultsManager.shared().email = txtFieldEmail.text!
                        goToMedia()
                    }
                }
            }
        }
    }
    
    //MARK:- Private Methods
    private func goToMedia(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MediaListVC") as! MediaListVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func isDataEntered() -> Bool {
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
    
    private func isDataValid() -> Bool {
        guard ValidationManager.shared().invalidEmail(txtFieldEmail.text!)! else {
            self.showAlert(message: "please enter valid email")
            return false
        }
        guard ValidationManager.shared().invalidPassword(txtFieldPassword.text!)! else {
            self.showAlert(message: "please enter valid password")
            return false
        }
        
        return true
    }
    
    private func matchingData(email: String, password: String) -> Bool {
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
}
