//
//  VisionPetView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-06.
//
import RealityKit
import SwiftUI
import RealityKit

struct VisionPetView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @State private var isImmersiveSpaceOpen = false
    
    
    var body: some View {
        HStack (spacing: 10) {
            Spacer()
            VStack{
                Image("petSplash")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Text("VisionPet")
                    .font(.extraLargeTitle)
                
            }
            Spacer()
            VStack (spacing: 20) {
                Button ("Play with Pet") {
                        if isImmersiveSpaceOpen {
                                Task { await dismissImmersiveSpace() }
                        } else {
                                Task { await openImmersiveSpace(id: "Immersive") }
                        }
                }
                .hoverEffect()
                .glassBackgroundEffect()
                .overlay{
                    Capsule()
                        .fill(Color.blue.opacity(0.2))
                }
                Button {
                    print("idle")
                } label: {
                    Text("Zoo Mode")
                }
                .hoverEffect()
                .glassBackgroundEffect()
                .overlay{
                    Capsule()
                        .fill(Color.blue.opacity(0.2))
                }
                
                Button {
                    print("haha")
                } label: {
                    Text("Buy another Pet for $100")
                }
                .hoverEffect()
                .glassBackgroundEffect()
                .overlay{
                    Capsule()
                        .fill(Color.blue.opacity(0.2))
                }
                
                Button {
                    print("haha")
                } label: {
                    Text("View Account")
                }
                .hoverEffect()
                .glassBackgroundEffect()
                .overlay{
                    Capsule()
                        .fill(Color.blue.opacity(0.2))
                }
                
            }
    
            Spacer()
        }
    }
}
//struct SphereView: View {
//   var body: some View {
//       RealityView { content in
//           let model = ModelEntity(
//                        mesh: .generateSphere(radius: 0.1),
//                        materials: [SimpleMaterial(color: .white, isMetallic: true)])
//           content.add(model)
//       }
//   }
//}

#Preview {
    VisionPetView()
}
