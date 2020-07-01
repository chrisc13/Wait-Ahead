//
//  MerchantAnnotation.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 7/1/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import Foundation
import MapKit
import UIKit


final class MerchantAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(merchant: Merchant) {
        self.title = merchant.name
        self.coordinate = merchant.coordinate
    }
}
