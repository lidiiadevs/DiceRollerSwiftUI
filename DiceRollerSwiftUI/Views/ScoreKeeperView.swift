//
//  ScoreKeeperView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 5/1/26.
//

import SwiftUI

struct ScoreKeeperView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0

    
    var body: some View {
        VStack(alignment: .center) {
            Text("Score Keeper")
                .font(.title)
                .padding(.bottom)
            
            SettingsView(startingPoints: $startingPoints, doesHighestScoreWin: $scoreboard.doesHighestScoreWin)
                .disabled(scoreboard.state != .setup)
            Grid{
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                        GridRow{
                            
                            HStack {
                                TextField("Name", text: $player.name)
                                    .autocorrectionDisabled(true)
                                if scoreboard.winners.contains(player){
                                    Image(systemName: "crown.fill")
                                        .foregroundStyle(.yellow)
                                }
                            }
                            
                            Text("\(player.score)")
                            
                            Stepper("\(player.score)", value: $player.score)
                                .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
                Button("Add Player", systemImage: "plus") {
                    scoreboard.players.append(Player(name: "", score: 0))
                }
                .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack {
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill"){
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill"){
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise"){
                        scoreboard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
           // .tint(.accentColor)
        }
        .bold()
        .padding()
        .tint(.accent)
    }
}

#Preview {
    ScoreKeeperView()
}
