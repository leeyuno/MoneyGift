//
//  Category.swift
//  MoneyGift
//
//  Created by leeyuno on 02/08/2019.
//  Copyright © 2019 leeyuno. All rights reserved.
//

import Foundation

struct CardList {
    var string: String?
    var last: Bool?
    var index: Int?
    var price: Int?
    var yes: Int?
    var no: Int?
    
    init(attributes: [String: Any?]) {
        string = attributes["title"] as? String
        last = attributes["bool"] as? Bool
        index = attributes["index"] as? Int
        price = attributes["price"] as? Int
        yes = attributes["yes"] as? Int
        no = attributes["no"] as? Int
    }
}
