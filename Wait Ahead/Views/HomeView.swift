//
//  HomeView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var searchedStore: String = ""
    @State private var selection = 2
    
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
                    MapView()
                    .edgesIgnoringSafeArea(.top)
                    
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
        
        
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }

    init() {
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
