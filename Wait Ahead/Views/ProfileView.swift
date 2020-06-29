//
//  ProfileView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack{
            Spacer()
            Text("My Profile")
            Spacer()
         
            Button(action: session.signOut){
                Text("Sign out").frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50).foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue,Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
