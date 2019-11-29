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
        
        self.backgroundColor = UIColor.clear
        let light_red =     childNode(withName: "light_red") as? SKEmitterNode
        let light_tiffany = childNode(withName: "light_tiffany") as? SKEmitterNode
        let light_purple =  childNode(withName: "light_purple") as? SKEmitterNode
        let dark_red =      childNode(withName: "dark_red") as? SKEmitterNode
        let dark_tiffany =  childNode(withName: "dark_tiffany") as? SKEmitterNode
        let dark_purple =   childNode(withName: "dark_purple") as? SKEmitterNode
        light_red?.advanceSimulationTime(60)
        light_tiffany?.advanceSimulationTime(60)
        light_purple?.advanceSimulationTime(60)
        dark_red?.advanceSimulationTime(60)
        dark_tiffany?.advanceSimulationTime(60)
        dark_purple?.advanceSimulationTime(60)
        
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
