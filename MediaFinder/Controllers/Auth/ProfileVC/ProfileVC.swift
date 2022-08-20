//
//  ProfileVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 24/06/2022.
//

import UIKit
import CLTypingLabel
import MarqueeLabel
import SDWebImage

class ProfileVC: UIViewController {
    
    //-------------------variables------------------------
    //var name: String!
    //var email: String!
    //var password: String!
    //var phone: String!
    //var address: String!
    var isLogedIn: Bool = true
    
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



//        imgViewUserProfile.sd_setImage(with: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS946FhBVYtF2hSHPH4hy4LmvJ2JRsmWe8_EA&usqp=CAU"), placeholderImage: UIImage(named: "https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=170667a&w=0&h=YGycIDbBRAWkZaSvdyUFvotdGfnKhkutJhMOZtIoUKY="))
