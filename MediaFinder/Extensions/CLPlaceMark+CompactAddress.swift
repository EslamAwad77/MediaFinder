//
//  CLPlaceMarkExtensions.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 05/07/2022.
//

import Foundation
import MapKit

extension CLPlacemark {
    var compactAddress: String? {
        if let name = name {
            var result = name
            if let street = thoroughfare{
                result += ", \(street)"
            }
            if let city = locality {
                result += ", \(city)"
            }
            if let country = country {
                result += ", \(country)"
            }
            return result
        }
    return nil
    }
    
}
