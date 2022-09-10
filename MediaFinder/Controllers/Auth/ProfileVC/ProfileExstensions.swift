//
//  ProfileExstensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//
import UIKit

extension ProfileVC {
    func getUserFromDB() {
        self.user1 = SQlManager.sharedObject().getUserData(email: UserDefaultsManager.shared().email)
    }
    
    func setup(){
        UserDefaultsManager.shared().isLogedIn = true
        getUserFromDB()
        fillData()
    }
    
    func fillData(){
        lblUserName.text = user1.name
        lblAddress.text = user1.address
        lblPhoneNumber.text = user1.phone
        imgViewUserProfile.image = user1.userImage!.getImage()
    }
    
    func setupNavItem(){
        self.navigationItem.title = "Your Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func dismissSelf(){
        isLogedIn = false
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.goToLoginVC()
    }
}
