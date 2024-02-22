//
//  hudView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//

import SwiftUI

public struct hudView: View {
    public var body: some View {
        HStack(spacing: 10) {
            hudButton(imageName: "arrowshape.turn.up.backward.fill") {print("back")}
            
            Divider()
                .frame(height: 35)
                .background(Color.white)
            
            hudButton(imageName: "fork.knife") {print("food")}
            hudButton(imageName: "waterbottle.fill") {print("water")}
            hudButton(imageName: "tennisball.fill") {print("play")}
            hudButton(imageName: "bell.fill") {print("whistle")}
            hudButton(imageName: "storefront.fill") {print("store")}
            
            Divider()
                .frame(height: 35)
                .background(Color.white)
            
            Spacer()
            
            HStack {
                Image(systemName: "pawprint.circle.fill")
                    .foregroundColor(.yellow)
                Text("1,000,000")
                    .foregroundColor(.yellow)
                    .font(.title)
            }
            .padding(10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Spacer()
        }
        .frame(maxWidth: 850, maxHeight: 80)
        .background(.thickMaterial)
        .glassBackgroundEffect(
            in: RoundedRectangle(cornerRadius: 25, style: .continuous)
        )
    
    }
}

struct hudButton: View {
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(.white)
                .imageScale(.large)
                .padding(10)
        }
        .background(.ultraThickMaterial)
        .glassBackgroundEffect(
            in: Circle()
        )
        .clipShape(Circle())
        .hoverEffect()
    }
}

#Preview {
    hudView()
}
