//
//  ContentView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    let gradientColors: [Color] = [.gradientTop, .gradientBottom]
    
    @State private var numberOfDice: Int = 1
    
    var body: some View {
            VStack {
                Text("Dice Roller")
                    .font(.largeTitle
                        .lowercaseSmallCaps())
                    .bold()
                    .foregroundStyle(.white)
                HStack {
                    ForEach(1...numberOfDice, id: \.description) { _ in DiceView()
                        
                    }
                }
                HStack(spacing: 25) {
                    Button("Remove Dice", systemImage: "minus.circle.fill") {
                        withAnimation {
                            numberOfDice -= 1
                        }}
                    .disabled(numberOfDice == 1)
                    
                    Button("Add Dice", systemImage: "plus.circle.fill") {
                        withAnimation {
                            numberOfDice += 1
                        }}
                    .disabled(numberOfDice == 5)
                }
                .labelStyle(.iconOnly)
                .padding()
                .font(.title)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: gradientColors))
            .tint(.white)
    }
}

#Preview {
    ContentView()
}
