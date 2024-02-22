//
//  foodView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//

import SwiftUI

struct foodView: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 15){
                HStack {
                    Image(systemName: "fork.knife")
                        .font(.title)
                        .padding(10)
                    
                    Text("Food")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Button(action: {
                        print("blah blah")
                    }) {
                        Image(systemName: "xmark")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .background(.thickMaterial)
                    .clipShape(Circle())
                }
                .padding(.leading, 25)
                .padding(.trailing, 25)
                
//                Divider()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    itemView(imageName: "food-burger", itemName: "Burger", price: 50, isOwned: false)
                    itemView(imageName: "food-pizza", itemName: "Pizza", price: 100, isOwned: false)
                    itemView(imageName: "food-steak", itemName: "Steak", price: 200, isOwned: false)
                    itemView(imageName: "food-burger", itemName: "Burger", price: 50, isOwned: false)
                    itemView(imageName: "food-pizza", itemName: "Pizza", price: 100, isOwned: false)
                    itemView(imageName: "food-steak", itemName: "Steak", price: 200, isOwned: false)
                    itemView(imageName: "food-burger", itemName: "Burger", price: 50, isOwned: false)
                    itemView(imageName: "food-pizza", itemName: "Pizza", price: 100, isOwned: false)
                    itemView(imageName: "food-steak", itemName: "Steak", price: 200, isOwned: false)
                    itemView(imageName: "food-burger", itemName: "Burger", price: 50, isOwned: false)
                    itemView(imageName: "food-pizza", itemName: "Pizza", price: 100, isOwned: false)
                    itemView(imageName: "food-steak", itemName: "Steak", price: 200, isOwned: false)
                }
                .padding(.horizontal, 10)
            }
            .padding(20)
        }
        .background(.thinMaterial)
        .glassBackgroundEffect()
    }
}

#Preview {
    foodView()
}
