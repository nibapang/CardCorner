//
//  CardDetailsStruct.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import Foundation

struct CardDetailsStruct {
    var name: String
    var cardImg: String
    var cardDetails: String
    var quiz: [CardQuizCategory]
}

struct CardQuizCategory {
    var que: String
    var op1: String
    var op2: String
    var correctAns: String
}
