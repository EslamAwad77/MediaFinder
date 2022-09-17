//
//  ProfileVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 24/06/2022.
//

import CLTypingLabel
import MarqueeLabel

class ProfileVC: UIViewController {
    
    //-------------------Variables------------------------
    var isLogedIn: Bool = true
    var user1: UserModel!
    
    //-------------------Outlet------------------------
    @IBOutlet weak var imgViewUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: MarqueeLabel!
    @IBOutlet weak var lblPhoneNumber: CLTypingLabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    //-------------------Lifecycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavItem()
        self.setup()
        imgViewUserProfile.roundedImage()
        navigationItem.backBarButtonItem?.tintColor = .white
    }
}
