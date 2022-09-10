//
//  AppDelegate.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 15/06/2022.
//

import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        handleKeyboard()
        handleRoot()
        SQlManager.sharedObject().setupConnection()
        return true
    }
}
//TODO: LifeCycle Of App Delegate
extension AppDelegate{
    func handleRoot(){
        let email = UserDefaults.standard.object(forKey: "email")
        let isLogedIn = UserDefaultsManager.shared().isLogedIn
        if email != nil{
            if isLogedIn {
                goToMediaVC()
            } else {
                goToLoginVC()
            }
        }
    }
}

extension AppDelegate {
    func handleKeyboard(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}

extension AppDelegate {
    func goToMediaVC(){
        let mediaVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MediaListVC") as! MediaListVC
        let navController = UINavigationController(rootViewController: mediaVC)
        window?.rootViewController = navController
    }
}

extension AppDelegate {
    func goToLoginVC(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        let navController = UINavigationController(rootViewController: profileVC)
        window?.rootViewController = navController
    }
}


