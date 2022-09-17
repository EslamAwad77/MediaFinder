//
//  ValidationManager.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 10/09/2022.
//

import Foundation

class ValidationManager{
    
    //MARK:- Singletone
    private static let sharedInstance = ValidationManager()
    
    static func shared() -> ValidationManager {
        return ValidationManager.sharedInstance
    }
    
    func invalidEmail(_ value: String) -> Bool?{
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }
    func invalidPassword(_ value: String) -> Bool? {
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }
    func invalidPhoneNumber(_ value: String) -> Bool? {
        let regex = "^[0-9]{11}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }
}
