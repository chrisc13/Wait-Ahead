//
//  HomeView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI
import MapKit
import Alamofire

struct HomeView: View {
    
     @ObservedObject var locationManager = LocationManager()
    @State private var searchedStore: String = ""
    @State private var selection = 2
    @State private var merchants: [Merchant] = [Merchant]()
    
    
    
    
    func getMerchants(){
        
        var coor1 = "+37.79107180,-122.41925980"
        var coor2 = "+37.79727180,-122.40555710"
        var coor3 = "+37.79748379,-122.42186129"
        
        var coorArr = [coor1, coor2, coor3]
        
//        for _ in coorArr {
//            Merchant(placemark: MKPlacemark)
//        }
        
//        let locations = [
//            Location(title: "New York, NY",    latitude: +37.79107180, longitude: -122.41925980),
//            Location(title: "Los Angeles, CA", latitude: +37.79727180, longitude: -122.40555710),
//            Location(title: "Chicago, IL",     latitude: +37.79748379, longitude: -122.42186129)
//        ]
//
//        for location in locations {
//            let annotation = MKPointAnnotation()
//            annotation.title = location.title
//            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
//            mapView.addAnnotation(annotation)
//        }
    }
    
    
//    func calculateOffset() -> CGFloat {
//
//        if self.merchants.count > 0 && !self.tapped {
//            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
//        }
//        else if self.tapped {
//            return 100
//        } else {
//            return UIScreen.main.bounds.size.height
//        }
//    }
    
    var body: some View {
        NavigationView {
        
        TabView(selection:$selection)  {
            QueueView()
                .tabItem {
                    Image("icons8-queue-26").renderingMode(.template)
            }
            .tag(1)
            VStack {
                
                //map with search overlay view
                ZStack{
                    
                    
                    
                    //map
                     MapView(merchants: merchants)
                    //.edgesIgnoringSafeArea(.top)
                    
                    //search bar
                    HStack {
                        Spacer()
                        Button(action: {
                            //todo later
                            }) {
                                  Image("icons8-slider-22")
                                    .renderingMode(.original)
                            }
                        TextField("Search nearby stores", text: $searchedStore)
                            .background(Color.white)
                            .frame(height: 50)
                            
                            .multilineTextAlignment(TextAlignment.center)
                        Button(action: {
                            //todo later
                            }) {
                                 Image("icons8-search-22")
                                    .renderingMode(.original)
                            }
                        Spacer()
                    }
                    .background(Color.white)
                    .padding()
                    .clipped()
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    .offset(y:-200)
                }
                
                //card view
                
//                HStack {
//                    Rectangle()
//                    .fill(Color.white)
//                    .frame(width: 100, height: 100)
//                    VStack{
//                        Text("Target")
//                        Text("Wait Time: 10 min")
//                        HStack{
//                            Text("Check In")
//                                .background(Color.blue)
//                            Text("Offers")
//                             .background(Color.orange)
//                        }
//
//                    }
//                }
                
                
                Text("Store card here")
                .padding(50)
                
            }
            .tabItem {
                Image("icons8-nearby-26").renderingMode(.template)
            }
            .tag(2)
            
            ProfileView()
                .tabItem {
                    Image("icons8-profile-26").renderingMode(.template)
            }
            .tag(3)
        }
        .font(.headline)
        .accentColor(.white)
            
            
            
            
       
            .navigationBarTitle("Wait Ahead", displayMode: .inline)
                       .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = #colorLiteral(red: 0.102, green: 0.1216, blue: 0.4431, alpha: 1)
                        nc.navigationBar.backgroundColor = #colorLiteral(red: 0.102, green: 0.1216, blue: 0.4431, alpha: 1)
                           nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                       })
        
        .navigationBarItems(trailing:
            Button(action: {
                self.getMerchants()
            }) {
                Text("Get Merchants")
            }
        )
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }

    init() {
       //get location
        
        // http://localhost:8080/locateAllMerchant/"37.725025"/"-122.461593"
        
        

           //let jsonData = try? JSONSerialization.data(withJSONObject: json)
 
        
        UITabBar.appearance().isTranslucent = true
                   UITabBar.appearance().barTintColor = #colorLiteral(red: 0.102, green: 0.1216, blue: 0.4431, alpha: 1)
    }
    
}
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
