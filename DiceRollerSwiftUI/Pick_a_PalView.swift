//
//  Pick-a-PalView.swift
//  DiceRollerSwiftUI
//
//  Created by Lidiia Diachkovskaia on 4/29/26.
//

import SwiftUI

struct Pick_a_PalView: View {
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title2)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
                .padding()
            
                List {
                    ForEach(names, id: \.description) { name in
                        Text(name)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
                TextField("Add name", text: $nameToAdd)
                    .autocorrectionDisabled(true)
                    .onSubmit {
                        if !nameToAdd.isEmpty { names.append(nameToAdd)
                            nameToAdd = ""
                        }
                    }
                Divider()
                
                Toggle("Remoxe when Picked", isOn: $shouldRemovePickedName)
                
                Button { // here we have action that is a imperative code
                    //pickedName = names.randomElement() ?? "No names yet"
                    
                    if let randomName = names.randomElement() { //if let - potentia;;y works with nil values
                        pickedName = randomName
                        
                        if shouldRemovePickedName { //this removes a picked name from  a list
                            names.removeAll { name in
                                return (name == randomName)
                            }
                        }
                        
                    } else {
                        pickedName = ""
                    }
                }
            label: { //declarative code
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
                .padding(.top)
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .padding()
    }
}

#Preview {
    Pick_a_PalView()
}
