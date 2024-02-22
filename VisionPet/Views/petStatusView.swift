//
//  petStatusView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//

import SwiftUI

struct petStatusView: View {
    var petName: String
    var foodLevel: Int
    var waterLevel: Int
    var playLevel: Int
    
    var body: some View {
        VStack {
            Text(petName)
                .font(.largeTitle)
            
            StatusLevelBar(level: foodLevel, icon: "fork.knife")
            StatusLevelBar(level: waterLevel, icon: "waterbottle.fill")
            StatusLevelBar(level: playLevel, icon: "tennisball.fill")
        }
        .frame(maxWidth: 350, maxHeight: 350)
        .background(.regularMaterial)
        .glassBackgroundEffect(
            in: RoundedRectangle(cornerRadius: 25, style: .continuous)
        )
    }
}

struct StatusLevelBar: View {
    var level: Int
    var icon: String
    
    private let maxLevel = 10
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            
            ForEach(0..<maxLevel, id: \.self) { index in
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(index < level ? levelColor : Color.gray)
                    .frame(width: 15, height: 20)
            }
        }
    }
    
    var levelColor: Color {
        if level <= 3 {
            return .red
        } else if level <= 6 {
            return .yellow
        } else {
            return .green
        }
    }
}

#Preview {
    petStatusView(petName: "Jafar", foodLevel: 9, waterLevel: 5, playLevel: 3)
}
