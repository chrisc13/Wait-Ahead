//
//  Coordinator.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate{
    var control: MapView
    init(_ control: MapView){
        self.control = control
    }
    
    
}
