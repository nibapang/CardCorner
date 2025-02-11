//
//  EasyFunc.swift
//  CardCorner
//
//  Created by Card Corner on 11/02/25.
//

import Foundation
import UIKit

let ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
let suits = ["clubs", "diamonds", "hearts", "spades"]

var cardAry: [CardStruct] = []

func GenrateRanAry() {
    
    for rank in ranks {
        for suit in suits {
            let correctCard = "\(rank)_of_\(suit)"
            let randomOptions = generateRandomOptions(correctCard: correctCard, ranks: ranks, suits: suits)
            let question = "Find the \(rank) of \(suit) among these 4 cards!"
            let cardStruct = CardStruct(que: question, fristImgName: randomOptions[0], secImgName: randomOptions[1], thirdImgName: randomOptions[2], fourthImgName: randomOptions[3], correctAns: correctCard)
            cardAry.append(cardStruct)
        }
    }

    func generateRandomOptions(correctCard: String, ranks: [String], suits: [String]) -> [String] {
        var options = Set<String>()
        options.insert(correctCard)
        while options.count < 4 {
            let randomRank = ranks.randomElement()!
            let randomSuit = suits.randomElement()!
            let randomCard = "\(randomRank)_of_\(randomSuit)"
            options.insert(randomCard)
        }
        return Array(options).shuffled()
    }

    print(cardAry)
    
}

var AllCardDetails = [
    CardDetailsStruct(name: "Clubs", cardImg: "ace_of_clubs", cardDetails: """
Clubs are one of the four suits in a standard deck of playing cards, symbolized by a three-leaf clover. Their black color makes them visually distinct from the red suits (hearts and diamonds). Historically, the clubs suit is said to represent the peasantry or working class, tying them to themes of labor, action, and creativity. The 13 cards in the suit range from 2 to 10, followed by the face cards: Jack, Queen, King, and the high card, Ace. In many games, clubs may have specific roles, such as being trump cards or forming critical combinations. Their versatility and symbolism add a dynamic layer to card games, making them an essential suit for both strategic and casual players alike.
""", quiz: clubsQuiz),

    CardDetailsStruct(name: "Diamonds", cardImg: "ace_of_diamonds", cardDetails: """
Diamonds are a striking suit in the deck, easily recognized by their bright red diamond-shaped symbol. Historically, they are associated with wealth, prosperity, and material abundance, representing the merchant class in older times. The suit of diamonds includes 13 cards, ranging from 2 to 10, along with the face cards: Jack, Queen, King, and the powerful Ace. In card games, diamonds often bring an element of high stakes and strategy, with their vibrant red color serving as a reminder of risk and reward. Whether used to form winning hands in poker or as critical suits in bridge, diamonds hold a timeless charm that captures the imagination of players across the world.
""", quiz: diamondsQuiz),

    CardDetailsStruct(name: "Hearts", cardImg: "ace_of_hearts", cardDetails: """
Hearts, represented by their iconic red heart shape, are often considered the most symbolic suit in a deck of playing cards. They are associated with love, passion, and emotion, making them stand out in any game. The suit contains 13 cards, from 2 to 10, followed by the face cards: Jack, Queen, King, and Ace. Historically, hearts were linked to the clergy or spiritual class, symbolizing inner strength and compassion. In modern games, hearts frequently play significant roles, such as being the suit to avoid in games like "Hearts" or forming vital combinations in rummy. Their emotional connection and visual appeal make hearts a beloved suit in card decks.
""", quiz: heartsQuiz),

    CardDetailsStruct(name: "Spades", cardImg: "ace_of_spades", cardDetails: """
Spades, represented by their sharp black spear-like symbol, are a bold and powerful suit in the world of playing cards. Historically, spades were linked to the warrior class, symbolizing strength, power, and intelligence. The suit consists of 13 cards, starting with the numbered cards 2 to 10, followed by the face cards: Jack, Queen, King, and the Ace, which is often the most significant card in many games. Spades are frequently central to the gameplay, as seen in the game "Spades," where they serve as trump cards. Their striking black color and spear-like design add a sense of authority and elegance to any deck, making them a favorite for players seeking a touch of sophistication in their card games.
""", quiz: spadesQuiz)
]

var clubsQuiz = [
    CardQuizCategory(que: "Which card is 2_of_clubs?", op1: "2_of_clubs", op2: "2_of_hearts", correctAns: "2_of_clubs"),
    CardQuizCategory(que: "Which card is 3_of_clubs?", op1: "3_of_clubs", op2: "3_of_diamonds", correctAns: "3_of_clubs"),
    CardQuizCategory(que: "Which card is 4_of_clubs?", op1: "4_of_spades", op2: "4_of_clubs", correctAns: "4_of_clubs"),
    CardQuizCategory(que: "Which card is 5_of_clubs?", op1: "5_of_clubs", op2: "5_of_hearts", correctAns: "5_of_clubs"),
    CardQuizCategory(que: "Which card is 6_of_clubs?", op1: "6_of_diamonds", op2: "6_of_clubs", correctAns: "6_of_clubs"),
    CardQuizCategory(que: "Which card is 7_of_clubs?", op1: "7_of_clubs", op2: "7_of_spades", correctAns: "7_of_clubs"),
    CardQuizCategory(que: "Which card is 8_of_clubs?", op1: "8_of_hearts", op2: "8_of_clubs", correctAns: "8_of_clubs"),
    CardQuizCategory(que: "Which card is 9_of_clubs?", op1: "9_of_clubs", op2: "9_of_diamonds", correctAns: "9_of_clubs"),
    CardQuizCategory(que: "Which card is 10_of_clubs?", op1: "10_of_spades", op2: "10_of_clubs", correctAns: "10_of_clubs"),
    CardQuizCategory(que: "Which card is ace_of_clubs?", op1: "ace_of_clubs", op2: "ace_of_hearts", correctAns: "ace_of_clubs"),
    CardQuizCategory(que: "Which card is king_of_clubs?", op1: "king_of_clubs", op2: "king_of_hearts", correctAns: "king_of_clubs"),
    CardQuizCategory(que: "Which card is queen_of_clubs?", op1: "queen_of_diamonds", op2: "queen_of_clubs", correctAns: "queen_of_clubs"),
    CardQuizCategory(que: "Which card is jack_of_clubs?", op1: "jack_of_diamonds", op2: "jack_of_clubs", correctAns: "jack_of_clubs")
]

var diamondsQuiz = [
    CardQuizCategory(que: "Which card is 2_of_diamonds?", op1: "2_of_diamonds", op2: "2_of_clubs", correctAns: "2_of_diamonds"),
    CardQuizCategory(que: "Which card is 3_of_diamonds?", op1: "3_of_diamonds", op2: "3_of_hearts", correctAns: "3_of_diamonds"),
    CardQuizCategory(que: "Which card is 4_of_diamonds?", op1: "4_of_spades", op2: "4_of_diamonds", correctAns: "4_of_diamonds"),
    CardQuizCategory(que: "Which card is 5_of_diamonds?", op1: "5_of_diamonds", op2: "5_of_clubs", correctAns: "5_of_diamonds"),
    CardQuizCategory(que: "Which card is 6_of_diamonds?", op1: "6_of_diamonds", op2: "6_of_spades", correctAns: "6_of_diamonds"),
    CardQuizCategory(que: "Which card is 7_of_diamonds?", op1: "7_of_clubs", op2: "7_of_diamonds", correctAns: "7_of_diamonds"),
    CardQuizCategory(que: "Which card is 8_of_diamonds?", op1: "8_of_hearts", op2: "8_of_diamonds", correctAns: "8_of_diamonds"),
    CardQuizCategory(que: "Which card is 9_of_diamonds?", op1: "9_of_diamonds", op2: "9_of_spades", correctAns: "9_of_diamonds"),
    CardQuizCategory(que: "Which card is 10_of_diamonds?", op1: "10_of_clubs", op2: "10_of_diamonds", correctAns: "10_of_diamonds"),
    CardQuizCategory(que: "Which card is ace_of_diamonds?", op1: "ace_of_clubs", op2: "ace_of_diamonds", correctAns: "ace_of_diamonds"),
    CardQuizCategory(que: "Which card is king_of_diamonds?", op1: "king_of_clubs", op2: "king_of_diamonds", correctAns: "king_of_diamonds"),
    CardQuizCategory(que: "Which card is queen_of_diamonds?", op1: "queen_of_diamonds", op2: "queen_of_spades", correctAns: "queen_of_diamonds"),
    CardQuizCategory(que: "Which card is jack_of_diamonds?", op1: "jack_of_diamonds", op2: "jack_of_clubs", correctAns: "jack_of_diamonds")
]

var heartsQuiz = [
    CardQuizCategory(que: "Which card is 2_of_hearts?", op1: "2_of_hearts", op2: "2_of_clubs", correctAns: "2_of_hearts"),
    CardQuizCategory(que: "Which card is 3_of_hearts?", op1: "3_of_spades", op2: "3_of_hearts", correctAns: "3_of_hearts"),
    CardQuizCategory(que: "Which card is 4_of_hearts?", op1: "4_of_diamonds", op2: "4_of_hearts", correctAns: "4_of_hearts"),
    CardQuizCategory(que: "Which card is 5_of_hearts?", op1: "5_of_clubs", op2: "5_of_hearts", correctAns: "5_of_hearts"),
    CardQuizCategory(que: "Which card is 6_of_hearts?", op1: "6_of_spades", op2: "6_of_hearts", correctAns: "6_of_hearts"),
    CardQuizCategory(que: "Which card is 7_of_hearts?", op1: "7_of_hearts", op2: "7_of_clubs", correctAns: "7_of_hearts"),
    CardQuizCategory(que: "Which card is 8_of_hearts?", op1: "8_of_hearts", op2: "8_of_diamonds", correctAns: "8_of_hearts"),
    CardQuizCategory(que: "Which card is 9_of_hearts?", op1: "9_of_diamonds", op2: "9_of_hearts", correctAns: "9_of_hearts"),
    CardQuizCategory(que: "Which card is 10_of_hearts?", op1: "10_of_clubs", op2: "10_of_hearts", correctAns: "10_of_hearts"),
    CardQuizCategory(que: "Which card is ace_of_hearts?", op1: "ace_of_hearts", op2: "ace_of_diamonds", correctAns: "ace_of_hearts"),
    CardQuizCategory(que: "Which card is king_of_hearts?", op1: "king_of_clubs", op2: "king_of_hearts", correctAns: "king_of_hearts"),
    CardQuizCategory(que: "Which card is queen_of_hearts?", op1: "queen_of_hearts", op2: "queen_of_spades", correctAns: "queen_of_hearts"),
    CardQuizCategory(que: "Which card is jack_of_hearts?", op1: "jack_of_clubs", op2: "jack_of_hearts", correctAns: "jack_of_hearts")
]

var spadesQuiz = [
    CardQuizCategory(que: "Which card is 2_of_spades?", op1: "2_of_clubs", op2: "2_of_spades", correctAns: "2_of_spades"),
    CardQuizCategory(que: "Which card is 3_of_spades?", op1: "3_of_spades", op2: "3_of_hearts", correctAns: "3_of_spades"),
    CardQuizCategory(que: "Which card is 4_of_spades?", op1: "4_of_spades", op2: "4_of_diamonds", correctAns: "4_of_spades"),
    CardQuizCategory(que: "Which card is 5_of_spades?", op1: "5_of_hearts", op2: "5_of_spades", correctAns: "5_of_spades"),
    CardQuizCategory(que: "Which card is 6_of_spades?", op1: "6_of_clubs", op2: "6_of_spades", correctAns: "6_of_spades"),
    CardQuizCategory(que: "Which card is 7_of_spades?", op1: "7_of_diamonds", op2: "7_of_spades", correctAns: "7_of_spades"),
    CardQuizCategory(que: "Which card is 8_of_spades?", op1: "8_of_spades", op2: "8_of_hearts", correctAns: "8_of_spades"),
    CardQuizCategory(que: "Which card is 9_of_spades?", op1: "9_of_spades", op2: "9_of_clubs", correctAns: "9_of_spades"),
    CardQuizCategory(que: "Which card is 10_of_spades?", op1: "10_of_spades", op2: "10_of_clubs", correctAns: "10_of_spades"),
    CardQuizCategory(que: "Which card is ace_of_spades?", op1: "ace_of_diamonds", op2: "ace_of_spades", correctAns: "ace_of_spades"),
    CardQuizCategory(que: "Which card is king_of_spades?", op1: "king_of_hearts", op2: "king_of_spades", correctAns: "king_of_spades"),
    CardQuizCategory(que: "Which card is queen_of_spades?", op1: "queen_of_diamonds", op2: "queen_of_spades", correctAns: "queen_of_spades"),
    CardQuizCategory(que: "Which card is jack_of_spades?", op1: "jack_of_spades", op2: "jack_of_clubs", correctAns: "jack_of_spades")
]
