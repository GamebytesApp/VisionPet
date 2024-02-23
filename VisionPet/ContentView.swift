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

    @State private var enlarge = false
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            RealityView { content in
                // Add the initial RealityKit content
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
            } update: { content in
                // Update the RealityKit content when SwiftUI state changes
                if let scene = content.entities.first {
                    let uniformScale: Float = enlarge ? 1.4 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
                enlarge.toggle()
            })

            VStack (spacing: 12) {
                Toggle("Enlarge RealityView Content", isOn: $enlarge)
                    .font(.title)

                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                    .font(.title)
            }
            .frame(width: 360)
            .padding(36)
            .glassBackgroundEffect()
            

        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}


//import SwiftUI
//import RealityKit
//import RealityKitContent
//
//struct ContentView: View {
//
//    @State private var showImmersiveSpace = false
//    @State private var immersiveSpaceIsShown = false
//
//    @Environment(\.openImmersiveSpace) var openImmersiveSpace
//    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
//
//    var body: some View {
//        VStack(alignment: .center, content: {
//            Text("Welcome to Vision Pet!")
//                .font(.extraLargeTitle2)
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
////            Button ("Play with Pet Test") {
////                Task {
////                    await openImmersiveSpace(id: "ImmersiveSpace")
////                }
////            }
////            .hoverEffect()
////            .glassBackgroundEffect()
////            .overlay{
////                Capsule()
////                    .fill(Color.blue.opacity(0.2))
////            }
//        })
//        .padding(50)
//        .glassBackgroundEffect()
//    }
//}
//
//#Preview {
//    ContentView()
//}
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
