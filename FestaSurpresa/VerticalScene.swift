//
//  VerticalScene.swift
//  FestaSurpresa
//
//  Created by MCavasin on 27/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class VerticalScene: SKScene {

    
    override func didMove(to view: SKView) {
        
        let vertical1 = childNode(withName: "ConfeteVert1") as? SKEmitterNode
        let vertical2 = childNode(withName: "ConfeteVert2") as? SKEmitterNode
        let vertical3 = childNode(withName: "ConfeteVert3") as? SKEmitterNode
        vertical1?.advanceSimulationTime(60)
        vertical2?.advanceSimulationTime(60)
        vertical3?.advanceSimulationTime(60)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
