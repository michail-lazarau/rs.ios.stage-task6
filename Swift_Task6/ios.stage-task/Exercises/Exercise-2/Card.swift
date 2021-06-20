import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit { get }
    var value: Value { get }
    var isTrump: Bool { get set }

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable {
    case six = 6
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible, Comparable {
    let suit: Suit
    let value: Value
    var rawValue: Int {
        value.rawValue
    }

    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.suit == rhs.suit {
            return lhs.rawValue == rhs.rawValue
        }
        return false
    }

    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.suit == rhs.suit {
            return lhs.rawValue < rhs.rawValue
        } else if lhs.isTrump {
            return false
        } else if rhs.isTrump { return true
        } else {
            return false
        }
    }
}

extension Card {
    func checkIfCanBeat(card: Card) -> Bool {
        return self > card
    }

    func checkValue(card: Card) -> Bool {
        return rawValue == card.rawValue
    }
}
