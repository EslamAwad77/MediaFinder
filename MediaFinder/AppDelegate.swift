//
//  AppDelegate.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 15/06/2022.
//

import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK:- Propreties
    var window: UIWindow?
    
    //MARK:- Application Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        handleKeyboard()
        handleRoot()
        SQlManager.shared().setupConnection()
        return true
    }
    
    //MARK:- Public Methods
    func goToLoginVC(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        let navController = UINavigationController(rootViewController: profileVC)
        window?.rootViewController = navController
    }
}

//MARK:- Private Methods
extension AppDelegate{
    private func handleRoot(){
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
    private func handleKeyboard(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    private func goToMediaVC(){
        let mediaVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MediaListVC") as! MediaListVC
        let navController = UINavigationController(rootViewController: mediaVC)
        window?.rootViewController = navController
    }
}
