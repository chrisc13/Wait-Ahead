//
//  ContentView.swift
//  Wait Ahead
//
//  Created by Gabriel Eddie Coto on 6/26/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var mysession: SessionStore
    
    @EnvironmentObject var userAuth: UserAuth
    
    func getUser(){
        session.listen()
    }
    
    
    
    func getAuthUser(){
        
        
    }
    
    var body: some View{
        Group {
            if (self.userAuth.isLoggedin) {
                 AuthView()
             } else {
                 HomeView()
             }
        }
            
//
//            if(userAuth != nil){
//                HomeView()
//            }else{
//                AuthView()
//                //MerchantHomeView()
//            }
//        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView().environmentObject(SessionStore())
    }
}
