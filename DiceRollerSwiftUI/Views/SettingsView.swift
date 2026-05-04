//
//  SettingsView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 5/4/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var startingPoints: Int
    @Binding var doesHighestScoreWin: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            .pickerStyle(.menu)
            
            Picker("Starting Points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting point")
                    .tag(1)
                Text("20- starting points")
                    .tag(2)
            }
            .pickerStyle(.menu)
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var startingPoints: Int = 10
    @Previewable @State var doesHighestScoreWin: Bool = true
    SettingsView(startingPoints: $startingPoints, doesHighestScoreWin: $doesHighestScoreWin)
}
