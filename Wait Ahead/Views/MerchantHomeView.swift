//
//  MerchantHomeView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/30/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct MerchantHomeView: View {
    @State private var selection = 2
    @State private var showingAlert = false
    
       var body: some View {
        
            NavigationView {
            
            TabView(selection:$selection)  {
                MerchantOffersView()
                    .tabItem {
                        Image("icons8-queue-26").renderingMode(.template)
                }
                .tag(1)
                
                
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
                     self.showingAlert = true
                 }) {
                     Text("About")
                 }
                 .alert(isPresented: $showingAlert) {
                     Alert(title: Text("Credits"), message: Text("Icons by https://icons8.com "), dismissButton: .default(Text("Got it!")))
                 }
             )
            
            }
            .navigationViewStyle(StackNavigationViewStyle())

        }

        init() {
            UITabBar.appearance().isTranslucent = true
                       UITabBar.appearance().barTintColor = #colorLiteral(red: 0.102, green: 0.1216, blue: 0.4431, alpha: 1)
        }
}

struct MerchantHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MerchantHomeView()
    }
}
