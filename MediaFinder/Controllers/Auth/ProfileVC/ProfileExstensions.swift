//
//  ProfileExstensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/07/2022.
//
import UIKit

extension ProfileVC {
    
    //MARK:- Public Methods
    func setup(){
        UserDefaultsManager.shared().isLogedIn = true
        getUserFromDB()
        fillData()
    }
    
    func setupNavItem(){
        self.navigationItem.title = "Your Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
    //MARK:- Private Methods
    private func fillData(){
        lblUserName.text = user1.name
        lblAddress.text = user1.address
        lblPhoneNumber.text = user1.phone
        imgViewUserProfile.image = user1.userImage.getImage()
    }
    
    private func getUserFromDB() {
        self.user1 = SQlManager.shared().getUserData(email: UserDefaultsManager.shared().email)
    }
    
    @objc private func dismissSelf(){
        isLogedIn = false
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.goToLoginVC()
    }
}
