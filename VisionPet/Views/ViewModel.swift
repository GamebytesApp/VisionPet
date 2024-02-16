//
//  ViewModel.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-14.
//

import Foundation
import Observation

enum FlowState {
    case idle
    case active
}

@Observable // new in xcode 15, replaces observable object
class ViewModel {
    
    var flowState = FlowState.idle
    
}
