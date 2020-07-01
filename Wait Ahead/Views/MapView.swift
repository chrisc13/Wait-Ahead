//
//  MapView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//
//
import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView) {
        
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
//
//                           let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//                           let region = MKCoordinateRegion(center: annotation.coordinate , span: span)
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 6000, longitudinalMeters: 6000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }
}


struct MapView: UIViewRepresentable {
    
    @Binding var merchants: [Merchant]
    
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
        
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let newAnnotations = merchants.map { MerchantAnnotation(merchant: $0) }
        mapView.addAnnotations(newAnnotations)
    }
    
}
