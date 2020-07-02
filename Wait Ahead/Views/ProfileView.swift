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
     @State var customer : Customer = Customer(id: 1, username: "Sonia", password: "", name: "Sonia", email: "sonia@email.com", phone: "800-234-5678", hasVisaCard: false)
    
    var body: some View {
        VStack{
            Image(systemName: "person")
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: 200, height:200).clipShape(Circle())
                .clipped().padding(.bottom,55)
            
               
                VStack(alignment: .center, spacing: 26){
                    
                    Text("Profile Page").font(.system(size:30)).bold().foregroundColor(.black)
                  
                    Text(customer.name).font(.system(size:18)).bold().foregroundColor(.black)
                    HStack{
                        Image(systemName: "envelope.badge.fill")
                        Text(customer.email).font(.system(size:18)).bold().foregroundColor(.black)
                    }
                    HStack{
                    Image(systemName: "phone.fill")
                        Text(customer.phone).font(.system(size:18)).bold().foregroundColor(.black)
                    }
            }
        
        Button(action: session.signOut){
                  Text("Sign out").frame(minWidth: 0, maxWidth: .infinity)
                          .frame(height: 50).foregroundColor(.white)
                          .background(Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0) ))
                          .cornerRadius(5)
                  }.cornerRadius(25)
                  .clipped()
            .shadow(color: .gray, radius: 10, x: 0, y: 5).padding(.all,23)
                                   
                    
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
