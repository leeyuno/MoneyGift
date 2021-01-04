//
//  Library.swift
//  MoneyGift
//
//  Created by leeyuno on 08/08/2019.
//  Copyright © 2019 leeyuno. All rights reserved.
//

import Foundation

class Library {
    static let object = Library()
    //["question": "", "yes": 0, "no": 0, "tag": 0, "price": 0, "end": false]
    var questions: [[String: Any]] = [
        ["question": "최근 1년간 청첩장이 아닌 목적으로 만난적이 있나요?", "yes": 1, "no": 2, "tag": 0, "price": 10000, "end": false],
        ["question": "청첩장을 직접 받으셨나요?", "yes": 3, "no": 2, "tag": 1, "price": 10000, "end": false],
        ["question": "청첩장을 모바일로 받으셨나요?", "yes": 4, "no": 3, "tag": 2, "price": -10000, "end": false],
        ["question": "회사 동료인가요?", "yes": 6, "no": 5, "tag": 3, "price": 10000, "end": false],
        ["question": "SNS나 메신저 서로 친구이신가요?", "yes": 8, "no": 3, "tag": 4, "price": 0, "end": false],
        ["question": "알고 지낸지 5년 이상되었나요?", "yes": 6, "no": 9, "tag": 5, "price": 0, "end": false],
        ["question": "꾸준히 연락하고 지내시나요?", "yes": 7, "no": 9, "tag": 6, "price": 10000, "end": false],
        ["question": "재혼인가요?", "yes": 8, "no": 8, "tag": 7, "price": -20000, "end": false],
        ["question": "결혼 성수기인가요?", "yes": 9, "no": 11, "tag": 8, "price": -10000, "end": false],
        ["question": "연회장이 호텔 뷔페인가요?", "yes": 11, "no": 10, "tag": 9, "price": 20000, "end": false],
        ["question": "식장이 지방에 있나요?", "yes": 13, "no": 11, "tag": 10, "price": -10000, "end": false],
        ["question": "답변자 본인은 2년안에 결혼계획이 있나요?", "yes": 14, "no": 12, "tag": 11, "price": 20000, "end": false],
        ["question": "금액이 뭔가 부족한것 같으신가요?", "yes": 14, "no": 13, "tag": 12, "price": 10000, "end": false],
        ["question": "봉투만 전해주셔도 괜찮아요", "yes": 0, "no": 0, "tag": 13, "price": 0, "end": true],
        ["question": "참석", "yes": 0, "no": 0, "tag": 14, "price": 0, "end": true]
    ]
}
