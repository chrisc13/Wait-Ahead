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
    
    func getUser(){
        session.listen()
        
    }
    
    var body: some View{
        Group {
            if(session.session != nil){
                
//
//                Button(action: session.signOut){
//                    Text("Sign out")
//                }
                HomeView()
            }else{
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView().environmentObject(SessionStore())
    }
}
