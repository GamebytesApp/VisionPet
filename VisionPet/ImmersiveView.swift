//
//  ImmersiveView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-06.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            do {
                let scene = try await Entity(named: "Immersive", in: realityKitContentBundle)
                content.add(scene)
            } catch {
                print("Error opening scene: \(error)")
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
