//
//  CustomerRegistration.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/30/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct CustomerRegistration: View {
    @EnvironmentObject var session: SessionStore
    
    @Binding var email: String
    @Binding var password: String
    @State var firstName: String
    @State var lastName: String
    @State var cardInfo: String
    
    
    
    func signUp() {
//        session.signUp(email: email, password: password) { (result,error) in
//            self.email=""
//            self.password=""
//        }
        if (self.cardInfo == ""){
            print("user will NOT use card")
        }
        
        
        
    }
    func addVisaCard(){
        
    }
        
        var body: some View{
            
            VStack{
                ZStack{
                        Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0))
                         .edgesIgnoringSafeArea(.all)

                    //app name and text fields
                    VStack{
                        Spacer()
                        Text("wait ahead.")
                            .padding()
                            .font(.system(size: 32, weight: .heavy))
                            .foregroundColor(.white)
                         Text("Last things to set up Profile")
                        .padding()
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.white)
                          .multilineTextAlignment(TextAlignment.center)
                        
                        HStack( alignment: .top, spacing: 10){
                            Spacer()
                            VStack(spacing: 10){
                                HStack{
                                Text("First Name:")
                                Spacer()
                                }
                                TextField("Enter First Name", text: $firstName)
                                    .font(.system(size: 14))
                                    .padding(12)
                                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                                HStack{
                                Text("Last Name:")
                                Spacer()
                                }
                                TextField("Enter First Name", text: $lastName)
                                    .font(.system(size: 14))
                                    .padding(12)
                                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                                HStack{
                                Spacer()
                                Button(action: addVisaCard) {
                                    Text("Add Visa Card").frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 40).foregroundColor(.white)
                                        .background(Color.init(UIColor(hue: 0.55, saturation: 0.99, brightness: 0.47, alpha: 1.0) ))
                                        .cornerRadius(5)
                                }.cornerRadius(25)
                                .clipped()
                                .shadow(color: .gray, radius: 10, x: 0, y: 5)
                                    .padding()
                                    .padding(.horizontal, 50)
                                    Spacer()
                                }
                            }
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(5)
                            Spacer()
                        }.clipped()
                            .shadow(color: .gray, radius: 10, x: 0, y: 5)
                            .offset(y:50)
                            
                        .keyboardResponsive()
                    }
                    
                }
                //sign-in button and sign-up link
                VStack (spacing: 10){
                    Spacer()
                    Button(action: signUp) {
                        Text("Register").frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50).foregroundColor(.white)
                            .background(Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0) ))
                            .cornerRadius(5)
                    }.cornerRadius(25)
                    .clipped()
                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                    .padding()
                    
                }.padding(.horizontal,32)
            }
            
        }
    }

