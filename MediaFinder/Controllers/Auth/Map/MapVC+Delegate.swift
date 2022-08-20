//
//  MapVC+Delegate.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 06/07/2022.
//

import UIKit
import MapKit

extension MapVC: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let lat = mapView.centerCoordinate.latitude
        let long = mapView.centerCoordinate.longitude
        let location = CLLocation(latitude: lat, longitude: long)
        getAddress(location: location)
    }
}

