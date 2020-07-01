//
//  Merchant.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 7/1/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import Foundation
import MapKit

struct Merchant {
    
    let placemark: MKPlacemark
    
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}

struct Location {
    let title: String
    let latitude: Double
    let longitude: Double
}
//
//final class LandmarkAnnotation: NSObject, MKAnnotation {
//    let title: String?
//    let coordinate: CLLocationCoordinate2D
//
//    init(landmark: Landmark) {
//        self.title = landmark.name
//        self.coordinate = landmark.coordinate
//    }
//}
