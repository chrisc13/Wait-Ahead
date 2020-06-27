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
    
    @State private var name: String = ""
    
    var body: some View {
        
            TabView {
                Text("Queue Tab")
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Queue")
                        
                    }
                
                    
                  MapView()
                 .edgesIgnoringSafeArea(.top)
                 .frame(height: 500)
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Search")
                    }
                Text("Profile Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Profile")
                    }
            }
            .font(.headline)
            
        .onAppear() {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().barTintColor = #colorLiteral(red: 0.102, green: 0.1216, blue: 0.4431, alpha: 1)
        }
        
    }
    

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
