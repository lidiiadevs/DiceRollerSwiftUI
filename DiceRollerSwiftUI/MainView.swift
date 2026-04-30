//
//  MainView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 4/30/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            ContentView()
                .tabItem {
                    Label("Dice", systemImage: "die.face.3.fill")
                }
            
            Pick_a_PalView()
                .tabItem {
                    Label("Pick", systemImage: "person.3.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
