//
//  MapView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//
//
//import SwiftUI
//import MapKit
//import Alamofire
//import ObjectMapper
//
//class MerchantLocatorResponse: Mappable {
//    //var avgCustomerWaitTime : Float?
//    //var id : Int;
//    var latitude : String?
//    var longitude : String?
//    //var maxAllowingCapacity : Int;
//    //var maxStoreCapacity : String;
//    //var merchantCategoryCode : String?
//    //var merchantName : String?
//    //var merchantOfferRelations : String?
//    //var user : String?
//    //var visaMerchantId : Any?
//    //var visaStoreId : Any?
//
//
//    required public init?(map: Map) {
//
//    }
//    public func mapping(map: Map) {
//
//        latitude    <- map["latitude"]
//        longitude    <- map["longitude"]
//    }
//}
//
//struct MapView: UIViewRepresentable {
//
//    let merchants: [Merchant]
//
//    private var locationManager = LocationManager()
//
//    func makeUIView(context: Context) -> MKMapView {
//
////       AF.request("http://localhost:8080/locateAllMerchant/"+"37.725025/-122.461593")
////        .responseObject{ (response: DataResponse<MerchantLocatorResponse,AFError>) in
////            print("hiiiii")
////
////            switch response.result {
////            case.success( let value):
////                print(value.toJSONString())
////                print(value.latitude)
////
////            case.failure(let error):
////                print(error)
////
////            }
////
////
//////            do{ let weatherResponse = try? response.result.get()
//////                print(response.result.value)
//////                print(weatherResponse!.latitude)
//////            }
//////            catch {
//////                print("JSONSerialization error:", error)
//////            }
////        }
//
//
//        let map = MKMapView()
//        map.showsUserLocation = true
//        map.delegate = context.coordinator
//
//
//
//        return map
//
//    }
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
//        guard let coor = locationManager.location?.coordinate else{return}
//        print(coor)
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//        let region = MKCoordinateRegion(center: coor , span: span)
//
//        // set the view
//        uiView.setRegion(region, animated: true)
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
//
//                            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//                           let region = MKCoordinateRegion(center: annotation.coordinate , span: span)
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 8000, longitudinalMeters: 8000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }
}


struct MapView: UIViewRepresentable {
    
   // private var locationManager = LocationManager()
    
    let merchants: [Merchant]
    //let locations: [Location]
    
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
        
//
//         guard let coor = locationManager.location?.coordinate else{return}
//         print(coor)
//
//         let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//         let region = MKCoordinateRegion(center: coor , span: span)
//
//         // set the view
//         uiView.setRegion(region, animated: true)
        //
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        let locations = [
                  Location(title: "New York, NY",    latitude: +37.79107180, longitude: -122.41925980),
                  Location(title: "Los Angeles, CA", latitude: +37.79727180, longitude: -122.40555710),
                  Location(title: "Chicago, IL",     latitude: +37.79748379, longitude: -122.42186129)
              ]

              for location in locations {
                  let annotation = MKPointAnnotation()
                  annotation.title = location.title
                  annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                
                  mapView.addAnnotation(annotation)
              }
//        mapView.removeAnnotations(mapView.annotations)
//        let annotations = self.merchants.map(MerchantAnnotation.init)
//        mapView.addAnnotations(annotations)
    }
    
}
