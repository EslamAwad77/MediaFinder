//
//  ProfileExstensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//

import Foundation
import UIKit


extension ProfileVC {
    
    func setup(){
        
        //UserDefaults.standard.set(isLogedIn, forKey: "isLogedIn")
        UserDefaultsManager.shared.isLogedIn = true
        if let user = UserDefaultsManager.shared.getUserDataFromCash(){
            self.lblUserName.text = user.name
            self.lblPhoneNumber.text = user.phone
            self.lblAddress.text = user.address
            self.imgViewUserProfile.image = user.userImage?.getImage()
        }
       
    }
    
    func setupNavItem(){
        self.navigationItem.title = "Your Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
//    func getObjectData() -> UserModel?{
//        if let data = UserDefaults.standard.data(forKey: "user1"){
//            do {
//                let jsonDecoder = JSONDecoder()
//                let userData = try jsonDecoder.decode(UserModel.self, from: data)
//                return userData
//                
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
//    }
    
    
    @objc func dismissSelf(){
        isLogedIn = false
       // let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.goToLoginVC()
        //appDel.window?.rootViewController = loginVC

    }
}
