//
//  MerchantDetailView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 7/1/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct MerchantDetailView: View {
   // @Binding var storeName : String
    var merchant: Merchant
    
    func enterQueue(){
        
        
    }
    
    var body: some View {
        //Text(self.storeName)
        
        VStack{
            Text(merchant.name)
            .font(.custom("HelveticaNeue-Medium", size: 30))
            Spacer()
            HStack{
            Spacer()
            Button(action: enterQueue) {
                Text("Join Queue").frame(minWidth: 0, maxWidth: .infinity)
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
    }
}

//struct MerchantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MerchantDetailView(storeName: <#Binding<String>#>)
//    }
//}
