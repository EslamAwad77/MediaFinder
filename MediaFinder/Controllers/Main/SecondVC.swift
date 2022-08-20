//
//  SecondVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 18/06/2022.
//

import UIKit

class SecondVC: UIViewController {

    @IBAction func btnGoToSecondVC(_ sender: UIButton) {
        //self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
