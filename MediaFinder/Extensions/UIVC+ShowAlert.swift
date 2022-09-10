//
//  UIViewControllerExstensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 25/07/2022.
//

import UIKit

extension UIViewController {
    func showAlert(message: String){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startSearching(message: String) {
        let alert = UIAlertController(title: "Welcome to our app", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func continueSearching(message: String) {
        let alert = UIAlertController(title: "Didn't find what you need?", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Find it, play it!", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
