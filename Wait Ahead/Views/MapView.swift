//
//  MapView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    private var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
       
        
        
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        guard let coor = locationManager.location?.coordinate else{return}
        print(coor)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coor , span: span)

        // set the view
        uiView.setRegion(region, animated: true)
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
