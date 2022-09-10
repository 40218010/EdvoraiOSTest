//
//  OrderModel.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/11.
//

import Foundation

struct Order: Decodable, Identifiable {
    let id = UUID()
    let orderID, productID, quantity, userID: Int
    let orderDate: String

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case productID = "product_id"
        case quantity
        case userID = "user_id"
        case orderDate = "order_date"
    }
    
    //Convert timestamp to date
    var orderTime: String {
        let time = Double(orderDate)
        let date = NSDate(timeIntervalSince1970: time ?? 0 )
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date as Date)
    }
    

    
}
