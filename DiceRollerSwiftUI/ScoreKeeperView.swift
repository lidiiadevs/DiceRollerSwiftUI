//
//  ScoreKeeperView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 5/1/26.
//

import SwiftUI

struct ScoreKeeperView: View {
    @State private var players: [Player] = [Player(name: "Mia", score: 0), Player(name: "Ben", score: 2), Player(name: "Steve", score: 0),]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Score Keeper")
                .font(.title)
                .padding(.bottom)
            Grid{
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                    ForEach($players) { $player in
                        GridRow{
                            TextField("Name", text: $player.name)
                                .autocorrectionDisabled(true)
                            
                            Text("\(player.score)")
                            
                            Stepper("\(player.score)", value: $player.score)
                                .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
                Button("Add Player", systemImage: "plus") {
                    players.append(Player(name: "", score: 0))
                    print(players)
                }
            Spacer()
        }
        .bold()
        .padding()
    }
}

#Preview {
    ScoreKeeperView()
}
