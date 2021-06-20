import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] { get set }
    var type: DeckType { get }
    var total: Int { get }
    var trump: Suit? { get set }
}

enum DeckType: Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    // MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total: Int {
        return type.rawValue
    }
}

extension Deck {
    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits: [Suit], values: [Value]) -> [Card] {
        // зачем в сигнатуре suits и values, если можно сгенерировать из enum Suit и Value через allCases
        var cardDeck: [Card] = [Card]()
        for suit in suits {
            for value in values {
                cardDeck.append(Card(suit: suit, value: value))
            }
        }
        return cardDeck
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        trump = cards.last?.suit

        for i in 0..<cards.count {
            if cards[i].suit == trump {
                cards[i].isTrump = true
            }
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for player in players {
            player.hand = [Card]() // otherwise append to nil
            for _ in 0...5 {
            player.hand?.append(cards.removeLast())
            }
            // alternative
//            player.hand?.append(contentsOf: cards.dropFirst(cards.count-6))
//            cards.removeLast(6)
        }
    }

    public mutating func setTrumpCards(for suit: Suit) {
        // useless func as per current implementation
        self.trump = suit
    }
}
