//
//  ProfileVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 24/06/2022.
//

import UIKit
import CLTypingLabel
import MarqueeLabel

class ProfileVC: UIViewController {
    //-------------------variables------------------------
    var isLogedIn: Bool = true
    var user1: UserModel!
    
    //-------------------outlet------------------------
    @IBOutlet weak var imgViewUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: MarqueeLabel!
    @IBOutlet weak var lblPhoneNumber: CLTypingLabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    //-------------------lifecycle------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavItem()
        self.setup()
        imgViewUserProfile.roundedImage()
        navigationItem.backBarButtonItem?.tintColor = .white
    }
}
