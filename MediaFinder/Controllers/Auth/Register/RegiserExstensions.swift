//
//  RegiserExstensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//

import UIKit

extension RegisterVC{
     func goToLogin(){
        let loginVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
     func fillUserObject(){
        user1.name = txtFieldUserName.text!
        user1.email = txtFieldEmail.text!
        user1.password = txtFieldPassword.text!
        user1.phone = txtFieldPhoneNumber.text!
        user1.address = txtFieldAddress.text!
        user1.userImage = ImageCodable(withImage: imgViewUser.image!)
        
    }
    // func SetDataOnCashMemory(){
        //UserDefaults.standard.set(txtFieldUserName.text, forKey: "UserName")
//        UserDefaults.standard.set(txtFieldEmail.text, forKey: "UserEmail")
//        UserDefaults.standard.set(txtFieldPassword.text, forKey: "UserPassword")
//        UserDefaults.standard.set(txtFieldPhoneNumber.text, forKey: "UserPhone")
//        UserDefaults.standard.set(txtFieldAddress.text, forKey: "UserAddress")
//
//        do{
//            let jsonEncoder = JSONEncoder()
//            let jsonData = try jsonEncoder.encode(user1)
//            //let json = String(data: jsonData, encoding: .utf8) ?? "{}"
//            UserDefaults.standard.set(jsonData, forKey: "user1")
//            UserDefaults.standard.synchronize()
//        } catch {
//            print(error.localizedDescription)
//        }
//         UserDefaultsManager.shared.SetDataOnCashMemory(user: user1)
//    }
    
    
    func isDataValid() -> Bool {
        guard invalidEmail(txtFieldEmail.text!)! else {
            self.showAlert(message: "please enter valid email")
            return false
            
        }
        guard invalidPassword(txtFieldPassword.text!)! else {
            self.showAlert(message: "please enter valid password")
            return false
            
        }
        guard invalidPhoneNumber(txtFieldPhoneNumber.text!)! else {
            self.showAlert(message: "please enter valid number")
            return false
            
        }
        return true
    }
    
//
//     func isDataEntered() -> Bool {
//         if let name = txtFieldUserName.text, let email = txtFieldEmail.text, let password = txtFieldPassword.text, let phone = txtFieldPhoneNumber.text, let address = txtFieldAddress.text{
//            if name != "" && email != "" && password != "" && phone != "" && address != "" {
//
//                return true
//            } else {
//               return false
//            }
//        } else {
//            return false
//        }
//    }
    
    func isDataEntered() -> Bool {
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
     func registerTapped(){
        if isDataEntered(){
            if isDataValid(){
                fillUserObject()
                UserDefaultsManager.shared.SetDataOnCashMemory(user: user1)
                goToLogin()
            }
        } else {
            print("please enter data")
        }
    }
    
    
}

