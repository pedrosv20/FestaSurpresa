//
//  WinScene.swift
//  FestaSurpresa
//
//  Created by MCavasin on 04/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class WinScene: SKScene {
    
    
    var winView = WinViewController()
    var light_red:      SKEmitterNode!
    var light_tiffany:  SKEmitterNode!
    var light_purple:   SKEmitterNode!
    var dark_red:       SKEmitterNode!
    var dark_tiffany:   SKEmitterNode!
    var dark_purple:    SKEmitterNode!
    var control                 = 1
    var xAcceleration:  CGFloat = 30.0
    var yAcceleration:  CGFloat = -300.0
    var funnel:         SKSpriteNode!
    var funnelName:     String!
    
    override func didMove(to view: SKView) {
        light_red     = childNode(withName: "light_red") as? SKEmitterNode
        light_tiffany = childNode(withName: "light_tiffany") as? SKEmitterNode
        light_purple  = childNode(withName: "light_purple") as? SKEmitterNode
        dark_red      = childNode(withName: "dark_red") as? SKEmitterNode
        dark_tiffany  = childNode(withName: "dark_tiffany") as? SKEmitterNode
        dark_purple   = childNode(withName: "dark_purple") as? SKEmitterNode
        funnel         = childNode(withName: "funnel") as? SKSpriteNode
        
//        setUp(FunnelName: "Organizer")
        
        
        //        light_red?.advanceSimulationTime(60)
        //        light_tiffany?.advanceSimulationTime(60)
        //        light_purple?.advanceSimulationTime(60)
        //        dark_red?.advanceSimulationTime(60)
        //        dark_tiffany?.advanceSimulationTime(60)
        //        dark_purple?.advanceSimulationTime(60)
        //alterado
        timer()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
//        timer()
//        if control == 1 {
//            light_red.particleBirthRate     = 70.0
//            light_red.particleBirthRate     = 70.0
//            light_tiffany.particleBirthRate = 70.0
//            light_purple.particleBirthRate  = 70.0
//            dark_red.particleBirthRate      = 70.0
//            dark_tiffany.particleBirthRate  = 70.0
//            dark_purple.particleBirthRate   = 70.0
//            control                         = 0
//        } else {
//
//            light_red.particleBirthRate     = 0.0
//            light_red.particleBirthRate     = 0.0
//            light_tiffany.particleBirthRate = 0.0
//            light_purple.particleBirthRate  = 0.0
//            dark_red.particleBirthRate      = 0.0
//            dark_tiffany.particleBirthRate  = 0.0
//            dark_purple.particleBirthRate   = 0.0
//            control                         = 1
//        }
        
        
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
    
    func setUp(FunnelName: String) {

//        winView.playAgain!.alpha = 0.0
        
        if FunnelName == "Organizer"{
            funnelName = "FunilVermelho"
            funnel.texture = SKTexture(imageNamed: funnelName + "3.pdf")
        } else if FunnelName == "PartyPooper"{
            funnelName = "FunilRoxo"
            funnel.texture = SKTexture(imageNamed: funnelName + "3.pdf")

        } else if FunnelName == "Clown"{
            funnelName = "FunilAzul"
            funnel.texture                = SKTexture(imageNamed: funnelName + "3.pdf")
    
            light_red.particleTexture     = SKTexture(imageNamed: "Clown.png")
            light_red.particleTexture     = SKTexture(imageNamed: "Clown.png")
            light_tiffany.particleTexture = SKTexture(imageNamed: "Clown.png")
            light_purple.particleTexture  = SKTexture(imageNamed: "Clown.png")
            dark_red.particleTexture      = SKTexture(imageNamed: "Clown.png")
            dark_tiffany.particleTexture  = SKTexture(imageNamed: "Clown.png")
            dark_purple.particleTexture   = SKTexture(imageNamed: "Clown.png")
    
            light_red.particleScale       = 0.6
            light_red.particleScale       = 0.6
            light_tiffany.particleScale   = 0.6
            light_purple.particleScale    = 0.6
            dark_red.particleScale        = 0.6
            dark_tiffany.particleScale    = 0.6
            dark_purple.particleScale     = 0.6
            
            light_red.position            = CGPoint(x: 195, y: -390)
            light_red.position            = CGPoint(x: 195, y: -390)
            light_tiffany.position        = CGPoint(x: 195, y: -390)
            light_purple.position         = CGPoint(x: 195, y: -390)
            dark_red.position             = CGPoint(x: 195, y: -390)
            dark_tiffany.position         = CGPoint(x: 195, y: -390)
            dark_purple.position          = CGPoint(x: 195, y: -390)
        }
        
        
        light_red.xAcceleration         = xAcceleration
        light_red.yAcceleration         = yAcceleration
        light_tiffany.xAcceleration     = xAcceleration
        light_tiffany.yAcceleration     = yAcceleration
        light_purple.xAcceleration      = xAcceleration
        light_purple.yAcceleration      = yAcceleration
        dark_red.xAcceleration          = xAcceleration
        dark_red.yAcceleration          = yAcceleration
        dark_tiffany.xAcceleration      = xAcceleration
        dark_tiffany.yAcceleration      = yAcceleration
        dark_purple.xAcceleration       = xAcceleration
        dark_purple.yAcceleration       = yAcceleration
        
        light_red.particleBirthRate     = 0.0
        light_red.particleBirthRate     = 0.0
        light_tiffany.particleBirthRate = 0.0
        light_purple.particleBirthRate  = 0.0
        dark_red.particleBirthRate      = 0.0
        dark_tiffany.particleBirthRate  = 0.0
        dark_purple.particleBirthRate   = 0.0
        
        self.backgroundColor            = UIColor.clear
        
        timer()
    }
    
    func initAnimation() {
        light_red.particleBirthRate     = 90.0
        light_red.particleBirthRate     = 90.0
        light_tiffany.particleBirthRate = 90.0
        light_purple.particleBirthRate  = 90.0
        dark_red.particleBirthRate      = 90.0
        dark_tiffany.particleBirthRate  = 90.0
        dark_purple.particleBirthRate   = 90.0
    }
    func killAnimation() {
        light_red.particleBirthRate     = 0.0
        light_red.particleBirthRate     = 0.0
        light_tiffany.particleBirthRate = 0.0
        light_purple.particleBirthRate  = 0.0
        dark_red.particleBirthRate      = 0.0
        dark_tiffany.particleBirthRate  = 0.0
        dark_purple.particleBirthRate   = 0.0
    }
    
    func timer(){
        let timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: { timer in
            if self.control == 1 {
                print(self.funnelName)
                self.funnel.texture = SKTexture(imageNamed: self.funnelName + "\(self.control).pdf")
                self.control = self.control + 1
            } else if self.control == 2 {
                self.funnel.texture = SKTexture(imageNamed: self.funnelName + "\(self.control).pdf")
                self.initAnimation()
                self.control = self.control + 1
            } else if self.control == 3 {
            self.funnel.texture = SKTexture(imageNamed: self.funnelName + "\(self.control).pdf")
            self.killAnimation()
                self.control = self.control + 1
//                self.winView.animate()
            } else {
                timer.invalidate()
                self.control = 1
            }
            
            
            
        })
    }
    
    
    
    
    //MARK: Animaçao com as texturas
    /*
    
    var PartyPooperFrames: [SKTexture] = []   // array de texturas
    var OrganizerFrames:   [SKTexture] = []
    var ClownFrames:       [SKTexture] = []
    let AnimatedAtlas = SKTextureAtlas(named: "assets") // salvar as imagens do arquivo atlas
    
    func buildCanoingTexture() {
        // funçao para construir o array de texturas e atribuir a textura para o player parado
        var partyPooperFrames:  [SKTexture] = []
        var organizerFrames:    [SKTexture] = []
        var clownFrames:        [SKTexture] = []
        for i in 1...3 {
            let PartyPooperTexture  = "FunilAzul\(i)"
            let OrganizerTexture    = "FunilRoxo\(i)"
            let ClownTexture        = "FunilVermeho\(i)"
            PartyPooperFrames.append(AnimatedAtlas.textureNamed(PartyPooperTexture))
            OrganizerFrames.append(AnimatedAtlas.textureNamed(OrganizerTexture))
            ClownFrames.append(AnimatedAtlas.textureNamed(ClownTexture))
            
        }
        PartyPooperFrames   = partyPooperFrames
        OrganizerFrames     = organizerFrames
        ClownFrames         = clownFrames
//        self.texture = AnimatedAtlas.textureNamed("FunilAzul1")
//        setUp()
    }
    
    func animatePlayer(direction: Int) {
        let padling = SKAction.repeatForever(
            SKAction.animate(with: CanoingFrames,
                             timePerFrame: 0.2,
                             resize: false,
                             restore: true))
        let padlingRight = SKAction.animate(with: CanoingRight,
                                            timePerFrame: 0.2,
                                            resize: false,
                                            restore: true)
        let padlingLeft = SKAction.animate(with: CanoingLeft,
                                           timePerFrame: 0.2,
                                           resize: false,
                                           restore: true)
        // função para a animação do player usando as texturas
        if direction == 0 {
            self.run(padling,
                     withKey:"walkingInPlacePlayer")
        } else if direction == 1{
            self.run(SKAction.sequence([padlingRight,padling]))
        } else if direction == 2 {
            self.run(SKAction.sequence([padlingLeft,padling]))
        }
        self.direction = direction
    }
    func ended(){
        removeAllActions()
    }
    
    */
}
