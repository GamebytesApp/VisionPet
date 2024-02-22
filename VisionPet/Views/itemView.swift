//
//  itemView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//

import SwiftUI

public struct itemView: View {
    var imageName: String
    var itemName: String
    var price: Int
    var isOwned: Bool
    
    public var body: some View {
        Button {
            print("\(itemName) pressed")
        } label: {
            VStack(alignment: .center, spacing: 10) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
//                    .offset(x: 5)
                Text(itemName)
                    .font(.headline)
                
                if isOwned {
                    Text("Owned")
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.yellow)
                } else {
                    HStack {
                        Image(systemName: "pawprint.circle.fill")
                            .foregroundColor(.yellow)
                        Text("\(price)")
                            .foregroundColor(.yellow)
                    }
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .background(.ultraThickMaterial)
        .glassBackgroundEffect(
            in: RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .hoverEffect()
    }
}

#Preview {
    HStack{
        itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
        itemView(imageName: "dog-black", itemName: "Black", price: 1000, isOwned: true)
    }
}
