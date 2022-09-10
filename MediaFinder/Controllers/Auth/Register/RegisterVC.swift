//  LoginVC.swift
//  MediaFinder
//  Created by eslam awad elsayed awad on 24/06/2022.
import UIKit

class RegisterVC: UIViewController {
    
    let imagePicker = UIImagePickerController()
    let user1: UserModel = UserModel()
    
    //-------------------IBOutlet------------------------
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldPhoneNumber: UITextField!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var imgViewUser: UIImageView!
    
    //-------------------Actions------------------------
    @IBAction func btnRegisterAccount(_ sender: UIButton) {
        registerTapped()
    }
    
    @IBAction func btnGoMap(_ sender: UIButton) {
        let mapVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "MapVC") as! MapVC
        mapVC.delegate = self
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @IBAction func btnUserImgPressed(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    //-------------------LifeCycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewUser.roundedImage()
        self.navigationItem.title = "Sign Up"
    }
}

extension RegisterVC: AddressDelegate {
    func sendAddress(address: String) {
        txtFieldAddress.text = address
    }
}


