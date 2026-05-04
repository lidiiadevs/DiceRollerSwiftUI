//
//  Player.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 5/1/26.
//

import Foundation
 
struct Player: Identifiable {
    
    var id = UUID()
    var name: String
    var score: Int = 0
    
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
