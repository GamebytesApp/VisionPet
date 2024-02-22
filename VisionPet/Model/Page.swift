//
//  Page.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//

import Foundation
import SwiftUI

enum Page: String, CaseIterable, Identifiable {
    
    case skins
    case collars
    case daycare
    case pawpoints
    
    var id: String {self.rawValue}
    
    var title: String {
        switch self {
        case .skins:
            "Skins"
        case .collars:
            "Collars"
        case .daycare:
            "Daycare"
        case .pawpoints:
            "PawPoints"
        }
    }
    
    var symbolName: String {
        switch self {
        case .skins:
            "dollarsign.circle"
        case .collars:
            "dollarsign.circle"
        case .daycare:
            "dollarsign.circle"
        case .pawpoints:
            "dollarsign.circle"
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch self {
        case .skins:
            skinsView()
        case .collars:
            collarsView()
        case .daycare:
            daycareView()
        case .pawpoints:
            pawpointsView()
        }
    }
    
}
