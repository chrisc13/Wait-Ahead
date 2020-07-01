//
//  Merchant.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 7/1/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import Foundation
import MapKit

struct Merchant : Identifiable {
    let id: String
    let name: String
    let location: CLLocationCoordinate2D
}
