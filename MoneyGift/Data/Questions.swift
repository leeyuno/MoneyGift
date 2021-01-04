//
//  Questions.swift
//  MoneyGift
//
//  Created by leeyuno on 08/08/2019.
//  Copyright © 2019 leeyuno. All rights reserved.
//

import Foundation

struct Questions {
    var question: String?
    var yes: Int?
    var no: Int?
    var price: Int?
    var tag: Int?
    var end: Bool?
    
    init(attributes: [String: Any]) {
        question = attributes["question"] as? String
        yes = attributes["yes"] as? Int
        no = attributes["no"] as? Int
        price = attributes["price"] as? Int
        tag = attributes["tag"] as? Int
        end = attributes["end"] as? Bool
    }
}
