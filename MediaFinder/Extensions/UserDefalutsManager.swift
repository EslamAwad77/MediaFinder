//
//  UserDefalutsManager.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 02/08/2022.
//

import Foundation

class UserDefaultsManager{

    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    var isLogedIn: Bool{
        set{
            UserDefaults.standard.setValue(newValue, forKey: "isLogedIn")
        }get{
            return UserDefaults.standard.bool(forKey: "isLogedIn")
            
        }
    }

    func getUserDataFromCash() -> UserModel?{
        if let data = UserDefaults.standard.data(forKey: "user1"){
            do {
                let jsonDecoder = JSONDecoder()
                let userData = try jsonDecoder.decode(UserModel.self, from: data)
                UserDefaults.standard.synchronize()
                return userData

            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    func SetDataOnCashMemory(user: UserModel){
       do{
           let jsonEncoder = JSONEncoder()
           let jsonData = try jsonEncoder.encode(user)
           //let json = String(data: jsonData, encoding: .utf8) ?? "{}"
           UserDefaults.standard.set(jsonData, forKey: "user1")
           UserDefaults.standard.synchronize()
       } catch {
           print(error.localizedDescription)
       }
   }
}
