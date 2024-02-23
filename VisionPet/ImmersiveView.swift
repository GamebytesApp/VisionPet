import SwiftUI
import RealityKit
import RealityKitContent

public enum PetAnimation: Int, CaseIterable {
    case SlowWalk = 0, SlowWalk_Blink, IntWalk, IntWalk_Blink, Running, Running_P, Jumping, TwoLegs, WalkSniff, StandSniff, SitDown_L, SitIdle_L, SitBark_L, SitUp_L, SitDown_LF, SitIdle_LF, SitBark_LF, SitUp_LF, SitDown_R, SitIdle_R, SitBark_R, SitUp_R, SitDown_RF, SitIdle_RF, SitBark_RF, SitUp_RF, SitDown_S, SitIdle_S, SitUp_S, StIdle, StIdle_Blink, StIdleE, StIdleE_Blink, SleepDown, SleepIdle, SleepUp, Eating, Drinks, Piss, Fall, FallUp
}

let FrameFor: [PetAnimation : (Double, Double)] = [
    .SlowWalk: (1, 24),
    .SlowWalk_Blink: (1, 47),
    .IntWalk: (50, 70),
    .IntWalk_Blink: (50, 90),
    .Running: (91, 110),
    .Running_P: (111, 130),
    .Jumping: (131, 150),
    .TwoLegs: (150, 180),
    .WalkSniff: (181, 204),
    .StandSniff: (205, 228),
    .SitDown_L: (230, 240),
    .SitIdle_L: (241, 271),
    .SitBark_L: (272, 281),
    .SitUp_L: (282, 292),
    .SitDown_LF: (293, 303),
    .SitIdle_LF: (304, 334),
    .SitBark_LF: (335, 344),
    .SitUp_LF: (345, 355),
    .SitDown_R: (356, 366),
    .SitIdle_R: (367, 397),
    .SitBark_R: (398, 407),
    .SitUp_R: (408, 418),
    .SitDown_RF: (419, 429),
    .SitIdle_RF: (430, 460),
    .SitBark_RF: (461, 470),
    .SitUp_RF: (471, 481),
    .SitDown_S: (482, 492),
    .SitIdle_S: (493, 523),
    .SitUp_S: (524, 534),
    .StIdle: (534, 590),
    .StIdle_Blink: (590, 646),
    .StIdleE: (647, 703),
    .StIdleE_Blink: (703, 758),
    .SleepDown: (759, 777),
    .SleepIdle: (777, 810),
    .SleepUp: (811, 832),
    .Eating: (833, 882),
    .Drinks: (883, 944),
    .Piss: (945, 980),
    .Fall: (981, 995),
    .FallUp: (995, 1010)
]

public func getAnimationStartAndEndTime(_ animationType: PetAnimation) -> (Double, Double) {
    guard let frameInterval = FrameFor[animationType] else {
        return (0, 0)
    }
    let startFrame = frameInterval.0
    let endFrame = frameInterval.1
    let startTime = startFrame / 24 + 0.02
    let endTime = endFrame / 24 - 0.02
    return (startTime, endTime)
}

extension Entity {
    func animationResource(for animationType: PetAnimation, repeatForever: Bool = false) throws -> AnimationResource {
        guard let baseAnimation = self.availableAnimations.first else {
            throw NSError(domain: "EntityAnimationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No base animations available"])
        }
        
        let timeRange = getAnimationStartAndEndTime(animationType)
        let animationView = AnimationView(source: baseAnimation.definition, name: "\(animationType)", bindTarget: nil, trimStart: timeRange.0, trimEnd: timeRange.1)
        
        if repeatForever {
            return try AnimationResource.generate(with: animationView.repeatingForever())
        } else {
            return try AnimationResource.generate(with: animationView)
        }
    }
}

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
                if let newDoggie = scene.findEntity(named: "NewDoggie"),
                       let baseAnimation = newDoggie.availableAnimations.first {
                    do {
                        // Translation Definition
                        let translateDef = FromToByAnimation(to: Transform(translation: [0.05, 0, 0]), duration: 1.9, bindTarget: .transform)
                        // Translate Resource
                        let translateResource = try AnimationResource.generate(with: translateDef)

                        // SlowWalk Animation Resource
                        let slowWalkResource = try newDoggie.animationResource(for: .SlowWalk)
                        let sitDownResource = try newDoggie.animationResource(for: .SitDown_L)
                        let drinkResource = try newDoggie.animationResource(for: .Drinks)
                        let pissResource = try newDoggie.animationResource(for: .Drinks)
                        let jumpingResource = try newDoggie.animationResource(for: .Jumping)
                        let sitIdleResource = try newDoggie.animationResource(for: .SitIdle_LF, repeatForever: true)
                        
                        // Animation Controllers - For Stopping mid animation
                        let translateAnimationController = newDoggie.playAnimation(translateResource, transitionDuration: 0.2, startsPaused: false)
                        let walkAnimationController = newDoggie.playAnimation(slowWalkResource, transitionDuration: 0.2, startsPaused: false)

                        // Combine into a sequence
                        let actionsSequence = try AnimationResource.sequence(with: [slowWalkResource.repeat(count: 2),sitDownResource,drinkResource.repeat(count: 2),jumpingResource.repeat(count: 2),pissResource.repeat(count: 2),sitDownResource,sitIdleResource])

                        // Play the combined sequence and translate at same time (Can't play in a AnimationGroup)
                        newDoggie.playAnimation(actionsSequence, transitionDuration: 0.2, startsPaused: false)
                        newDoggie.playAnimation(translateResource, transitionDuration: 0.2, startsPaused: false)
                    } catch {
                        print("Failed to create or play animations: \(error)")
                    }

                }
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
