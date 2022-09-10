//
//  MapVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 04/07/2022.
//

import UIKit
import MapKit

protocol AddressDelegate: AnyObject {
    func sendAddress(address: String)
}

class MapVC: UIViewController {

    let locationManager = CLLocationManager()
    weak var delegate: AddressDelegate?
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var lblShowNAmeOfLocation: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkOnServiceEnabled()
        mapView.delegate = self
    }
    
    @IBAction func btnSubmitLocation(_ sender: UIButton) {
        delegate?.sendAddress(address: lblShowNAmeOfLocation.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
}


