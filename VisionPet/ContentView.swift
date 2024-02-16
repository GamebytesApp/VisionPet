//
//  ContentView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-06.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack(alignment: .center, content: {
            Text("Welcome to Vision Pet!")
                .font(.extraLargeTitle2)
//            Button (immersiveSpaceIsShown ? "Back to Menu" : "Play with Pet") {
//                print("pressed button")
//                Task {
//                    if immersiveSpaceIsShown {
//                        await dismissImmersiveSpace()
//                    } else {
//                        await openImmersiveSpace(id: "ImmersiveSpace")
//                    }
//                }
//                immersiveSpaceIsShown.toggle()
//            }
            Button ("Play with Pet Test") {
                Task {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                }
            }
            .hoverEffect()
            .glassBackgroundEffect()
            .overlay{
                Capsule()
                    .fill(Color.blue.opacity(0.2))
            }
        })
        .padding(50)
        .glassBackgroundEffect()
    }
}

#Preview {
    ContentView()
}
//
//
//VStack {
//    Text("Welcome to VisionPet")
//        .offset(z: 100)
//        .padding(.bottom, 50)
//    
//    Model3D(named: "Scene", bundle: realityKitContentBundle)
//        .padding(.bottom, 50)
//    
//
//
//    Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
//        .toggleStyle(.button)
//        .padding(.top, 50)
//}
//.padding()
//.onChange(of: showImmersiveSpace) { _, newValue in
//    Task {
//        if newValue {
//            switch await openImmersiveSpace(id: "ImmersiveSpace") {
//            case .opened:
//                immersiveSpaceIsShown = true
//            case .error, .userCancelled:
//                fallthrough
//            @unknown default:
//                immersiveSpaceIsShown = false
//                showImmersiveSpace = false
//            }
//        } else if immersiveSpaceIsShown {
//            await dismissImmersiveSpace()
//            immersiveSpaceIsShown = false
//        }
//    }
//}
