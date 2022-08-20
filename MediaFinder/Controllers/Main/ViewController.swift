//
//  ViewController.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 15/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var txtFieldPutName: UITextField!
    
    
    @IBAction func btnPutNameOnTxtField(_ sender: UIButton) {
        if let name = txtFieldPutName.text{
            if !name.isEmpty{
                lblName.text = name
            } else{
                txtFieldPutName.placeholder = "Put Your Name"
            }
        }
        
    }
    
    @IBAction func btnGoToSecondVC(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "SecondVC", sender: nil)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

