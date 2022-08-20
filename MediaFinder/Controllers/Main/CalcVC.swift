//
//  CalcVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 20/06/2022.
//

import UIKit

class CalcVC: UIViewController {
    
    //-------------------variables---------------------------
    
    //-------------------Outlet---------------------------
    
    @IBOutlet weak var txtFieldFirstNum: UITextField!
    @IBOutlet weak var txtFieldSecondNum: UITextField!
    @IBOutlet weak var lblResultOfAdding: UILabel!
    @IBOutlet weak var lblResultOfMultiply: UILabel!
    
    //-------------------Actions---------------------------
    
    @IBAction func btnAdding(_ sender: UIButton) {
  
        let firstNum = Double(txtFieldFirstNum.text!)
        let secondNum = Double(txtFieldSecondNum.text!)
        let resultOfAdding: Double = Double(firstNum! + secondNum!)
        lblResultOfAdding.text = "\(resultOfAdding)"
        txtFieldFirstNum.text = ""
        txtFieldSecondNum.text = ""
        
    }
    
    @IBAction func btnMultiplication(_ sender: UIButton) {
       
        let firstNum = Double(txtFieldFirstNum.text!)
        let secondNum = Double(txtFieldSecondNum.text!)
        let resultOfMultiply: Double = Double(firstNum! * secondNum!)
        lblResultOfMultiply.text = "\(resultOfMultiply)"
        txtFieldFirstNum.text = ""
        txtFieldSecondNum.text = ""
    }
    
    //-------------------LifeCycle---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//        let result: Int = ("\(txtFieldFirstNum.text)" as! Int) + ("\(txtFieldSecondNum.text)" as! Int)
//        lblResultOfAdding.text = String(result)
//        lblResultOfAdding.text = txtFieldFirstNum.text + txtFieldSecondNum.text
//        lblResultOfAdding.text = "\(txtFieldFirstNum.text ?? "")" + "\(txtFieldSecondNum.text ?? "")"
//        let result = "\(txtFieldFirstNum.text ?? "")" * "\(txtFieldSecondNum.text ?? "")"
//        lblResultOfAdding.text = result
