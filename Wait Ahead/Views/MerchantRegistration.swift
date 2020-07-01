//
//  MerchantRegistration.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/30/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI
import Alamofire

struct MerchantRegistration: View {
    @EnvironmentObject var session: SessionStore
     
     @Binding var email: String
     @Binding var password: String
     @State var username: String
     @State var phone: String
     @State var merchantName: String
     @State var storeId: Int?
     @State var maxCapacity: Int?
     @State var maxAllowingCapacity: Int?
     @State var avgServiceTime: Int?
    @State var visaid: Int?
     
     
     
     func signUp() {
//         session.signUp(email: email, password: password) { (result,error) in
//             self.email=""
//             self.password=""
//         }
        
        self.username = "Merchant"
            //set phone somewhere in UI!!!
            self.phone = "111"
        self.visaid = 1234
            
            
            
            let jsonRequest: [String: Any] = [ "user" : [
                "username" : self.username,
                "password" : self.password,
                "userType" : "MERCHANT",
                ],"visaMerchantID": self.visaid,
                 "merchantName" : self.merchantName,
                 "latitute": [nil],
                 "longituted":[nil],
                 "visaStoreId":self.storeId,
                 "maxStoreCapacity":self.maxCapacity,
                 "maxAllowingCapacity":self.maxAllowingCapacity,
                 "avgCustomerWaitTime":self.avgServiceTime,
                 "merchantOfferRelations":[nil]
                   
                   
            ]
            
            
              AF.request("http://localhost:8080/registerMerchant", method: .post, parameters: jsonRequest, encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    
                }
            
        }
     
         
         var body: some View{
             
             VStack{
                 ZStack{
                     Color.init(UIColor(hue: 0.6556, saturation: 0.76, brightness: 0.44, alpha: 1.0))
                         .edgesIgnoringSafeArea(.all)

                     //app name and text fields
                     VStack{

                            Text("We just need some Store information.")
                           .padding()
                           .font(.system(size: 20, weight: .heavy))
                           .foregroundColor(.white)
                        .multilineTextAlignment(TextAlignment.center)
                         HStack(spacing: 10){
                             Spacer()
                             VStack(spacing: 10){
                               HStack{
                                 Text("Store Capacity:")
                                 Spacer()
                                 }
                                 TextField("Enter Max Capacity", value: $maxCapacity, formatter: NumberFormatter())
                                     .keyboardType(UIKeyboardType.decimalPad)
                                     .font(.system(size: 14))
                                     .padding(12)
                                     .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
//                                HStack{
//                                 Text("Allowing Capacity:")
//                                 Spacer()
//                                 }
//                                 TextField("Enter Max Allowing Capacity", value: $maxAllowingCapacity, formatter: NumberFormatter())
//                                     .keyboardType(UIKeyboardType.decimalPad)
//                                     .font(.system(size: 14))
//                                     .padding(12)
//                                     .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                                HStack{
                                 Text("Avergage Service Time per Customer:")
                                 Spacer()
                                 }
                                 TextField("Enter Avergage Service Time per Customer:", value: $avgServiceTime, formatter: NumberFormatter())
                                     .keyboardType(UIKeyboardType.decimalPad)
                                     .font(.system(size: 14))
                                     .padding(12)
                                     .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
                                 HStack{
                                 Text("Store Id:")
                                 Spacer()
                                 }
                                 TextField("Enter Store Id", value: $storeId, formatter: NumberFormatter())
                                     .keyboardType(UIKeyboardType.decimalPad)
                                     .font(.system(size: 14))
                                     .padding(12)
                                     .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))

                                HStack{
                                    Text("Merchant Name:")
                                    Spacer()
                                }
                                TextField("Enter Merchant Name", text: $merchantName)
                                    .font(.system(size: 14))
                                    .padding(12)
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
//
//
//TextField("Enter Merchant Id", value: $merchantId, formatter: NumberFormatter())
//    .keyboardType(UIKeyboardType.decimalPad)
//    .font(.system(size: 14))
//    .padding(12)
//    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.gray,lineWidth: 1))
