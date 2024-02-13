//
//  VisionPetApp.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-06.
//

import SwiftUI

@main
struct VisionPetApp: App {
    @State private var immersionState: ImmersionStyle = .mixed
    
    var body: some Scene {
        WindowGroup ("VisionPet", id: "visionPetApp") {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        .immersionStyle(selection: $immersionState, in: .mixed)
    }
}
