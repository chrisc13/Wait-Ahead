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
import ObjectMapper

struct HomeView: View {
    
    @State var merchants: [Merchant]
        = [
            Merchant(id: "1", name: "Target", location: .init(latitude: +37.79107180, longitude: -122.41925980)),
            Merchant(id: "2", name: "Walmart", location: .init(latitude: +37.79727180, longitude: -122.40555710)),
            Merchant(id: "3", name: "Starbucks", location: .init(latitude: +37.79748379, longitude: -122.42186129))
    ]
    
    
    @ObservedObject var locationManager = LocationManager()
    @State private var searchedStore: String = ""
    @State private var selection = 2
    
    
    var body: some View {
       
            
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
                        MapView(merchants: $merchants)
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
                    
                    Spacer()
                    List(merchants) { merchant in
                        MerchantCard(merchant: merchant)
                    }.frame(height: 150)
                    
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
        
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    init(merchants: [Merchant]) {
        self._merchants = State(wrappedValue: merchants)
        
    }
    
    init() {
        
        //try adding more annotation here
        //        let n = Merchant(id: "2", name: "Store 2", location: .init(latitude: +37.79727180, longitude: -122.40555710))
        //        self.merchants.append(n)
        
        
        //fire request
//          AF.request("http://localhost:8080/locateAllMerchant/"+"37.725025/-122.461593")
//                .responseObject{ (response: DataResponse<MerchantLocatorResponse,AFError>) in
//                    print("hiiiii")
//        
//                    switch response.result {
//                    case.success( let value):
//                        print(value.toJSONString())
//                        print(value.latitude)
//        
//                    case.failure(let error):
//                        print(error)
//        
//                    }
//        
//            }
        
        
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.102, green: 0.1216, blue: 0.4431, alpha: 1)
    }
    
}
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

struct MerchantCard: View {
    var merchant: Merchant
    
    func offerPop() {
        print("****** showing offers ******")
    }
    
    var body: some View {
        
        HStack {
           
                NavigationLink(destination:MerchantDetailView(merchant: merchant) ) {
                    //MerchanRow(trail: trail)
                    HStack{
                         Spacer()
                        VStack(spacing: 8){
                            
                           
                            Text(merchant.name)
                            .font(.custom("HelveticaNeue-Medium", size: 20))
                            Text("Wait Time:")
                                .multilineTextAlignment(.center)
                            .font(.custom("HelveticaNeue-Medium", size: 14))
                            .foregroundColor(Color.gray)
                           
                        }
                         Spacer()
                    }
                }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
