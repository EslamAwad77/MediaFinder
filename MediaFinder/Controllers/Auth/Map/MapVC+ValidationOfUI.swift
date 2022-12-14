//
//  MapVC+ValidationOfUI.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 06/07/2022.
//

import MapKit

extension MapVC {
    
    //MARK:- Public Methods
    func checkOnServiceEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            checkForAuth()
        } else {
            print("can not Get Location Without the permission")
        }
    }
    
    func getAddress(location: CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { placeMark, error in
            if error != nil{
                print(error!.localizedDescription)
            } else {
                if let firstPlaceMark = placeMark?.first{
                    let detailedAddress = firstPlaceMark.compactAddress
                    self.lblShowNAmeOfLocation.text = detailedAddress
                }
            }
        }
    }
    
    //MARK:- Private Methods
    private func getCurrentUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
            self.getAddress(location: locationManager.location!)
        }
    }
    
    private func openOnCustomLocation(){  // for check
        let location = CLLocation(latitude: 31.08, longitude: 31.62)
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        self.getAddress(location: location)
    }
    
    private func checkForAuth(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedAlways, .authorizedWhenInUse:
            getCurrentUserLocation()
        case .restricted, .denied:
            print("can't get location without permissions")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            print("can't get location without permissions")
        }
    }
}
