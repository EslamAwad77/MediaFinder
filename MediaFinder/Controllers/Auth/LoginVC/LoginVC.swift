//
//  LoginVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 24/06/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    //-------------------variables------------------------
    //var name: String!
    var email: String!
    var password: String!
    //var userOne: UserModel!
    
    //var phone: String!
    //var address: String!
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    //-------------------Actions------------------------
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        loginTapped()
    }
    
    @IBAction func btnGoRegister(_ sender: UIButton) {
        let registerVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(registerVC, animated: true)
        // why we must to do push ??
    }
    //-------------------lifecycle-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //-------------------functions-----------------------
    
     func setup(){
        self.navigationItem.title = "Sign In"
        //UserDefaults.standard.set(false, forKey: "isLogedIn") // make a flag
         UserDefaultsManager.shared().isLogedIn = false
//         if let user = UserDefaultsManager.shared().getUserDataFromCash() {
//            self.email = user.email
//            self.password = user.password
//        }
//        print(self.email)
//        print(self.password)
    }
    
//     func getUserData() -> UserModel?{
//         if let data = UserDefaults.standard.data(forKey: "user1"){
//             do {
//                 let jsonDecoder = JSONDecoder()
//                 let userData = try jsonDecoder.decode(UserModel.self, from: data)
//                 return userData
//                 
//             } catch {
//                 print(error.localizedDescription)
//             }
//         }
//         return nil
//     }
    

}
