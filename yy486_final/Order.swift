//
//  Order.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import Foundation

//id, merchid, buyerid, buyer notes, number of items
//if pickedup, if paid

//{
//  "orders": [
//    {
//      "id": 1,
//      "mid": 1,
//      "bid": 1,
//      "notes": "Food",
//      "num": 1,
//      "pickedUp": false,
//      "paid": false
//    }
//  ]
//}

struct Order: Codable {
    var id: Int?
    var mid: Int
    var bid: Int
    var notes: String
    var num: Int
    var pickedUp: Bool
    var paid: Bool
}

struct OrderResponse: Codable {
    var orders: [Order]
}
