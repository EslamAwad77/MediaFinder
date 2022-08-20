//
//  AppDelegate.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 15/06/2022.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        let email = UserDefaults.standard.object(forKey: "user1")
        let isLogedIn = UserDefaultsManager.shared.isLogedIn
        if email != nil{
            if isLogedIn {
                goToMediaVC()
            } else {
                goToLoginVC()
            }
        }
        return true
    }
    
    func goToMediaVC(){
        let mediaVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MediaListVC") as! MediaListVC
        let navController = UINavigationController(rootViewController: mediaVC)
        window?.rootViewController = navController
    }
  
    
    func goToLoginVC(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        let navController = UINavigationController(rootViewController: profileVC)
        window?.rootViewController = navController
    }
}

