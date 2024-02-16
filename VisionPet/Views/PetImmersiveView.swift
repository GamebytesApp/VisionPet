//
//  PetImmersiveView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-14.
//

import SwiftUI
import RealityKit

struct PetImmersiveView: View {
    
    var body: some View {
        RealityView {content in
            content.add(spaceOrigin)
            content.add(cameraAnchor)
            
        }
    }
}

#Preview {
    PetImmersiveView()
}
