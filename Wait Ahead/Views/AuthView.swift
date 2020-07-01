//
//  AuthView.swift
//  Wait Ahead
//
//  Created by Gabriel Eddie Coto on 6/26/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI
import Alamofire

//{"username":"sonia","password":"sonia"}

struct ToDo: Decodable {
    let email: String
    let password: String
    
    
}

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    
    func signIn(){
        var testUser : [String: String] = [ "username" : self.email, "password" : self.password  ]
        
         //let url = URL(string: "http://localhost:8080/login")
        
         //guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        //var request = URLRequest(url: requestUrl)
        //request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        //let postString = "username="+self.email+"&password="+self.password;
        let json: [String: Any] = ["username": self.email,
                                   "password": self.password]

        //let jsonData = try? JSONSerialization.data(withJSONObject: json)
        AF.request("http://localhost:8080/login", method: .post, parameters: json, encoding: JSONEncoding.default)
        .responseJSON { response in
            print(response)
        }
        //task.resume();
    }
    
    func apiSignIn(){
        print(self.email)
        print(self.password)
        
//        guard let url = URL(string:"") else {
//            fatalError("erroe getiing login url")
//        }
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, response, erros) in
//            <#code#>
//        }
//
       guard let url = URL(string: "http://www.stackoverflow.com") else { return }

       let task = URLSession.shared.dataTask(with: url) { data, response, error in

         guard let data = data, error == nil else { return }

         print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
       }
        task.resume()
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
                Button(action: apiSignIn) {
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
    @State var confrimPassword: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
//    func signUp() {
//        if (!isFormValid()){
//            self.error = "Passwords do not match"
//        }else{
//            session.signUp(email: email, password: password) { (result,error) in
//                if let error = error {
//                    self.error = error.localizedDescription
//                }else{
//                    self.email=""
//                    self.password=""
//                }
//            }
//        }
//    }
//    
//    
//    
//    
//    func isFormValid() -> Bool{
//        if (password != confrimPassword){
//            return false
//        }else{
//            return true
//        }
//    }
    
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
                    HStack(spacing: 10){
                        Spacer()
                        VStack(spacing: 10){
                            HStack{
                            Text("Email:")
                            Spacer()
                            }
                            TextField("Enter an Email Address", text: $email)
                                .font(.system(size: 14))
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                            HStack{
                            Text("Password:")
                            Spacer()
                            }
                            TextField("Choose a Password", text: $password)
                                .font(.system(size: 14))
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
//                            HStack{
//                                Text("Confirm Password:")
//                                Spacer()
//                            }
//                            SecureField("Password",text: $confrimPassword)
//                                .font(.system(size: 14)).padding(12)
//                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
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
                //Missing arguments for parameters 'username', 'hasVisaCard', 'phone' in call
                NavigationLink(destination: CustomerRegistration(email: self.$email, password: self.$password, firstName: "", lastName: "", cardInfo: "", username: "", hasVisaCard: false, phone: "" ) ) {
                          Text("Continue").frame(minWidth: 0, maxWidth: .infinity)
                           .frame(height: 50).foregroundColor(.white)
                           .background(Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0) ))
                           .cornerRadius(5)
                   }.cornerRadius(25)
                .clipped()
                .shadow(color: .gray, radius: 10, x: 0, y: 5)
                .disabled(self.email.isEmpty || self.password.isEmpty )
                
                
                
                //Missing arguments for parameters 'isMerchant', 'merchantId', 'storeId', 'maxCapacity', 'maxAllowingCpapacity', 'avgServiceTime' in call
                NavigationLink(destination: MerchantRegistration(email: self.$email, password: self.$password, merchantName: "", storeId: "", maxCapacity: nil, maxAllowingCapacity: nil, avgCustomerWaitTime: nil, visaid: "" ) ) {
                          Text("Register as Merchant").frame(minWidth: 0, maxWidth: .infinity)
                           .frame(height: 50).foregroundColor(.white)
                           .background(Color.init(UIColor(hue: 0, saturation: 0, brightness: 0.33, alpha: 1.0) ))
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


//NavigationLink(destination: CustomerRegistration(email: self.email) ) {
//          Text("Register as Merchant").frame(minWidth: 0, maxWidth: .infinity)
//           .frame(height: 50).foregroundColor(.white)
//           .background(Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0) ))
//           .cornerRadius(5)
//   }.cornerRadius(25)
//.clipped()
//.shadow(color: .gray, radius: 10, x: 0, y: 5)



