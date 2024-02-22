//
//  skinsView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//

import SwiftUI

struct skinsView: View {
    var body: some View {
        ScrollView {
//            Spacer()
            VStack(alignment: .leading, spacing: 25, content: {
                Text("Common")
                    .font(.title)
                    .padding(.leading, 25)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-black", itemName: "Black", price: 1000, isOwned: true)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-black", itemName: "Black", price: 1000, isOwned: true)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                }
                .padding(.horizontal, 15)
                
                Text("Rare")
                    .font(.title)
                    .padding(.leading, 25)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-black", itemName: "Black", price: 1000, isOwned: true)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-black", itemName: "Black", price: 1000, isOwned: true)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                }
                .padding(.horizontal, 15)
                
                Text("Legendary")
                    .font(.title)
                    .padding(.leading, 25)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                    itemView(imageName: "dog-black", itemName: "Black", price: 1000, isOwned: true)
                    itemView(imageName: "dog-peach", itemName: "Peach", price: 1000, isOwned: false)
                }
                .padding(.horizontal, 15)
                
                Spacer()
                
            })
        }
    }
}

#Preview {
    skinsView()
}
