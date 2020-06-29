//
//  AuthView.swift
//  Wait Ahead
//
//  Created by Gabriel Eddie Coto on 6/26/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn(){
        session.signIn(email: email, password: password){ (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
            }
        }
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
                        .padding(20)
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.white)
                    HStack(spacing: 10){
                        Spacer()
                        VStack(spacing: 10){
                            HStack{
                            Text("Email:")
                            Spacer()
                            }
                            TextField("Enter Email Address", text: $email)
                                .font(.system(size: 14))
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                            HStack{
                            Text("Password:")
                            Spacer()
                            }
                            SecureField("Enter Password",text: $password)
                                .font(.system(size: 14)).padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                        }
                        .padding(20)
                        .padding(.vertical, 10)
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
            VStack{
                Spacer()
                Button(action: signIn) {
                    Text("Sign in").frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50).foregroundColor(.white)
                        .background(Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0) ))
                        .cornerRadius(5)
                }.cornerRadius(25)
                .clipped()
                .shadow(color: .gray, radius: 10, x: 0, y: 5)
                
                if(error != ""){
                    Text(error).font(.system(size: 12, weight: .semibold)).foregroundColor(.red)
                        .offset(y:20)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                NavigationLink(destination: SignUpView()){
                    VStack{
                        Text("Don't have an account? Start Here").font(.system(size: 16, weight: .light)).foregroundColor(Color.black)
                            .padding()
                    }
                }
            }.padding(.horizontal,32)
        }
    }
    
}

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { (result,error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email=""
                self.password=""
            }
        }
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
                        .padding(20)
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.white)
                    HStack(spacing: 10){
                        Spacer()
                        VStack(spacing: 10){
                            HStack{
                            Text("Email:")
                            Spacer()
                            }
                            TextField("Email address", text: $email)
                                .font(.system(size: 14))
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                            HStack{
                            Text("Password:")
                            Spacer()
                            }
                            SecureField("Password",text: $password)
                                .font(.system(size: 14)).padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                            HStack{
                                Text("Confirm Password:")
                                Spacer()
                            }
                            SecureField("Password",text: $password)
                                .font(.system(size: 14)).padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
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
            VStack{
                Spacer()
                Button(action: signUp) {
                    Text("Create Account").frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50).foregroundColor(.white)
                        .background(Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0) ))
                        .cornerRadius(5)
                }.cornerRadius(25)
                .clipped()
                .shadow(color: .gray, radius: 10, x: 0, y: 5)
                
                if(error != ""){
                    Text(error).font(.system(size: 12, weight: .semibold)).foregroundColor(.red)
                        .offset(y:20)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }.padding(.horizontal,32)
        }
        
    }
}

struct AuthView: View {
    var body: some View{
        NavigationView{
           SignInView()
        }
        .accentColor(Color.gray)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View{
        AuthView().environmentObject(SessionStore())
    }
}