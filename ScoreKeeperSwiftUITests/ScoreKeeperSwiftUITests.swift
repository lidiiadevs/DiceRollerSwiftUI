//
//  ScoreKeeperSwiftUITests.swift
//  ScoreKeeperSwiftUITests
//
//  Created by Lidiia Diachkovskaia on 5/3/26.
//

import Testing
@testable import DiceRollerSwiftUI

struct ScoreKeeperSwiftUITests {

    @Test("Resetv player scores") func resetScores() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        var scoreboard = Scoreboard(players: [
            Player(name: "Sasha", score: 5),
            Player(name: "MIa", score: 9),
        ])
        scoreboard.resetScores(to: 0)
        
        for player in scoreboard.players {
            #expect(player.score == 0)
            
        }
    }
    
    @Test("Highest Score wins") func highestScoreWins() {
        let scoreboard = Scoreboard(players: [
            Player(name: "Sasha", score: 0),
            Player(name: "Mia", score: 4),
        ],
                                    state: . gameOver,
                                    doesHighestScoreWin: true
        
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Mia", score: 4)])
    }
    @Test("Lowest Score Wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(players: [
        Player(name: "Sasha", score: 0),
        Player(name: "MIa", score: 4),
    ],
                                state: . gameOver,
                                doesHighestScoreWin: false
    
    )
    let winners = scoreboard.winners
    #expect(winners == [Player(name: "Sasha", score: 0)])
    }
}
