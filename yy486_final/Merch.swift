//
//  Merch.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import Foundation

//id, sellerid, name, general type, description, price, pickup time, pickup place

//{
//  "messages": [
//    {
//      "id": 1,
//      "sid": 1,
//      "name": "Matcha Cookie",
//      "generalType": "Food",
//      "description": "Come and get matcha cookies with white chocolate.",
//      "price": 3,
//      "pickupTime": "Apr30 1-5pm",
//      "pickupPlace":"Upson Hall"
//    }
//  ]
//}

struct Merch: Codable {
    var id: Int?
    var sid: Int
    var name: String
    var generalType: String
    var description: String
    var price: Int
    var pickupTime: String
    var pickupPlace: String
}

struct MerchResponse: Codable {
    var multiMerch: [Merch]
}
