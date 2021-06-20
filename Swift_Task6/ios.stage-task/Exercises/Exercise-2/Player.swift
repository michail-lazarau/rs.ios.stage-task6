//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?
    // нерабочее говно =(
//    private var _hand: [Card]?
//    var hand: [Card]? {
//        get {
//            _hand
//        }
//        set {
//            if _hand == nil {
//                _hand = [Card]()
//            }
//            _hand = newValue
//        }
//    }

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if hand != nil {
//            self.hand?.first {$0.checkValue(card: card) == true}
            for handCard in hand! {
                if handCard.checkValue(card: card) == true {
                    return true
                }
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        // [Card(suit: .clubs, value: .seven): Card(suit: .clubs, value: .ace)]
//        table.forEach { key, value in
//            <#code#>
//        }
        if hand != nil {
            return hand!.contains(where: { card in
                card.checkValue(card: table.first!.key) || card.checkValue(card: table.first!.value)
                //            card.checkValue(card: Array(table.keys)[0]) || card.checkValue(card: Array(table.values)[0])
            })
        }
        return false
    }
}
