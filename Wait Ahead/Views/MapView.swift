//
//  MapView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI
import MapKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class MerchantLocatorResponse: Mappable {
    //var avgCustomerWaitTime : Float?
    //var id : Int;
    var latitude : String?
    var longitude : String?
    //var maxAllowingCapacity : Int;
    //var maxStoreCapacity : String;
    //var merchantCategoryCode : String?
    //var merchantName : String?
    //var merchantOfferRelations : String?
    //var user : String?
    //var visaMerchantId : Any?
    //var visaStoreId : Any?
    
    
    required public init?(map: Map) {

    }
    public func mapping(map: Map) {
        
        latitude    <- map["latitude"]
        longitude    <- map["longitude"]
    }
}

struct MapView: UIViewRepresentable {
  
    
    
    private var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        
       AF.request("http://localhost:8080/locateAllMerchant/"+"37.725025/-122.461593")
        .responseObject{ (response: DataResponse<MerchantLocatorResponse,AFError>) in
            print("hiiiii")
            
            switch response.result {
            case.success( let value):
                print(value.toJSONString())
                print(value.latitude)
               
            case.failure(let error):
                print(error)
               
            }
        
            
//            do{ let weatherResponse = try? response.result.get()
//                print(response.result.value)
//                print(weatherResponse!.latitude)
//            }
//            catch {
//                print("JSONSerialization error:", error)
//            }
        }
        
        
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
