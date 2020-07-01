//
//  MerchantOffersView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/30/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct MerchantOffersView: View {
    
    init() {
        //make GET offers api here
    }
   
    
    
    
    var body: some View {
        
        Text("Offers:")
        let first = Offer(name: "50% off")
        let second = Offer(name: "20% off")
        let third = Offer(name: "10% off")
        let offers = [first, second, third]

        return List(offers) { offers in
            OfferRow(offer: offers)
        }
        
    }
}

struct Offer: Identifiable {
    var id = UUID()
    var name: String
}
struct OfferRow: View {
    var offer: Offer

    var body: some View {
        Text("Come and eat at \(offer.name)")
    }
}

struct MerchantOffersView_Previews: PreviewProvider {
    static var previews: some View {
        MerchantOffersView()
    }
}
