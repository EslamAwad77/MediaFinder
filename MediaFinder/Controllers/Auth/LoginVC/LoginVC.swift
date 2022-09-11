//
//  LoginVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 24/06/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    //-------------------variables------------------------
    var email: String!
    var password: String!

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
    }
    
    //-------------------lifecycle-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //-------------------functions-----------------------
     func setup(){
        self.navigationItem.title = "Sign In"
         UserDefaultsManager.shared().isLogedIn = false
    }
}
