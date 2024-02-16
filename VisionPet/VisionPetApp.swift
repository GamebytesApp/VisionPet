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
    @State private var viewModel = ViewModel() // persist instance of ViewModel throughout app
    
    var body: some Scene { // system by default launches only first scene in body
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }.windowStyle(.plain)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(viewModel)
        }
        .immersionStyle(selection: $immersionState, in: .mixed)
    }
}
