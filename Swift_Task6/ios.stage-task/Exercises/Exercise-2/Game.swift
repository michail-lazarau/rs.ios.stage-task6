//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
//        players.filter { player in
//            player.hand?.contains(where: { card in
//                card.isTrump && card.value.rawValue.
//            })
//        }

        players.filter { $0.hand!.contains(where: { card in
            card.isTrump
        }) }
            .min { playerA, playerB in
                playerA.hand!.filter{$0.isTrump}.min()! < playerB.hand!.filter{$0.isTrump}.min()!
            }

        
//        .min { playerA, playerB in
//            playerA.hand!.filter{$0.isTrump}.min(by: { cardA, CardB in
//                cardA.rawValue < CardB.rawValue
//            })! < playerB.hand!.filter{$0.isTrump}.min(by: { cardA, CardB in
//                cardA.rawValue < CardB.rawValue
//            })!
//        }
        
        
//        for player in players {
//            player.hand?.min(by: { cardA, CardB in
//                cardA.rawValue < CardB.rawValue
//            })
//        }
    }
}
