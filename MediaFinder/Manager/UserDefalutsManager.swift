//
//  UserDefalutsManager.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 02/08/2022.
//

import Foundation

class UserDefaultsManager{
    static let sharedInstance = UserDefaultsManager()
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    private let defaults = UserDefaults.standard
    var isLogedIn: Bool{
        set{
            UserDefaults.standard.setValue(newValue, forKey: Config.UserDefaultsKeys.isLogedIn)
        }get{
            return UserDefaults.standard.bool(forKey: Config.UserDefaultsKeys.isLogedIn)
            
        }
    }
    var email: String {
        set {
            defaults.setValue(newValue, forKeyPath: "email")

        } get {
            guard  defaults.object(forKey: "email") != nil else {
                return "No email found in user defaults"
            }
            return defaults.string(forKey: "email")!
        }
    }
}
