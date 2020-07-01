//
//  Customer.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/30/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import Foundation


//implentation:
//var customer = Customer(--fields  here--)
//var card = Card(--fields here--)
//customer.card = card

class Customer{
    var id : Int?
    var username : String?
    var password: String?
    var name: String?
    var email: String?
    var phone: String?
    var hasVisaCard: Bool?
    var card : Card?
    
    init(id: Int, username: String, password: String, name: String, email: String, phone: String, hasVisaCard: Bool ) {
        self.id = id
        self.username = username
        self.password = password
        self.name = name
        self.email = email
        self.phone = phone
        self.hasVisaCard = hasVisaCard
        //var object = A(a: 5, b: "Hello World")
    }
    
}

class Card{
    var cardNum : String?
    var cvv: String?
    var billingZipCode: String?
    var expirationMonth: Int?
    var expirationYear: Int?
    var nameOnCard: String?
    
    init(cardNum: String, cvv: String, billingZipCode: String, expirationMonth: Int, expirationYear: Int, nameOnCard: String ) {
         self.cardNum = cardNum
         self.cvv = cvv
         self.billingZipCode = billingZipCode
         self.expirationMonth = expirationMonth
         self.expirationYear = expirationYear
         self.nameOnCard = nameOnCard
    }
}

//class customerLoginResponse: Decodable {
//    var response: String
//    var message: String
//    var userProfile: UserProfile
//
//}
//
//class UserProfile: Decodable{
//    var id : Int
//    var user: User
//
//
//    init(json: [String : Any] ) {
//        <#statements#>
//    }
//
//}
//
//class User: Decodable{
//    var id : Int
//    var username : String
//    var password: String
//
//}
