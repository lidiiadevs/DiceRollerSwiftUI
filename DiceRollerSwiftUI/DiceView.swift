//
//  DiceView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 4/28/26.
//

import SwiftUI

struct DiceView: View {
    
    @State private var numberOfPips: Int = 1
    
    var body: some View {
     
            VStack {
                Image(systemName: "die.face.\(numberOfPips).fill")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .foregroundStyle(.pink, .white)
                    .aspectRatio(1, contentMode: .fit)
                   // .fontWeight(.semibold)
                Button("Roll") {
                    withAnimation {
                        numberOfPips = Int.random(in: 1...6)
                    }
            }
                .foregroundStyle(.white)
                .font(.caption)
                .fontWeight(.bold)
                .padding(10)
                .buttonStyle(.bordered)
            }
            
        }
}
        

#Preview {
    DiceView()
}
