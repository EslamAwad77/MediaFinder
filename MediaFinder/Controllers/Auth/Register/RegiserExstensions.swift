//
//  RegiserExstensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//

import UIKit

extension RegisterVC{
    
    //MARK:- Public Methods
    public func registerTapped(){
        if isDataEntered(){
            if isDataValid(){
                let user = UserModel(name: txtFieldUserName.text!, email: txtFieldEmail.text!, password: txtFieldPassword.text!, phone: txtFieldPhoneNumber.text!, address: txtFieldAddress.text!, userImage: ImageCodable(withImage: imgViewUser.image!))
                if let userData = encodeUserToData(user: user) {
                    SQlManager.shared().insertUser(user: userData)
                    goToLogin()
                }
            }
        } else {
            print("please enter data")
        }
    }
    
    //MARK:- Private Methods
    private func goToLogin(){
        let loginVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func encodeUserToData(user: UserModel) -> Data? {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            return data
        } catch {
            print(error.localizedDescription)
        }
        return nil
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
        guard ValidationManager.shared().invalidPhoneNumber(txtFieldPhoneNumber.text!)! else {
            self.showAlert(message: "please enter valid number")
            return false
        }
        return true
    }
    
    private func isDataEntered() -> Bool {
        guard let name = txtFieldUserName.text, name != "" else{
            self.showAlert(message: "please enter valid name")
            return false
        }
        guard let email = txtFieldEmail.text, email != "" else{
            self.showAlert(message: "please enter valid email")
            return false
        }
        guard let password = txtFieldPassword.text, password != "" else{
            self.showAlert(message: "please enter valid password")
            return false
        }
        guard let phone = txtFieldPhoneNumber.text, phone != "" else{
            self.showAlert(message: "please enter valid number")
            return false
        }
        guard let address = txtFieldAddress.text, address != "" else{
            self.showAlert(message: "please enter valid address")
            return false
        }
        return true
    }
}
