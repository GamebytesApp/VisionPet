//
//  ViewModel.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-14.
//

import Foundation
import Observation
import ARKit
import RealityKit

enum FlowState {
    case movingIdle
    case stillIdle
    case sleeping
    case running
    case sitSad
    case eating
    case drinking
    case peePoo
    case fetch
    case petting
}

@Observable // new in xcode 15, replaces observable object
class ViewModel {
    
    private let worldTracking = WorldTrackingProvider()
    private let planeDetection = PlaneDetectionProvider()
    
    var flowState = FlowState.stillIdle
    
}
