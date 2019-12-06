//
//  WaitingRoom.swift
//  FestaSurpresa
//
//  Created by MCavasin on 03/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class WaitingRoom: SKScene {

    var circle = SKShapeNode(circleOfRadius: 300)

    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.clear
//        let circle = childNode(withName: "circle") as? SKSpriteNode
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: CGFloat(300), startAngle: CGFloat(0),
                                      endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circle.position = CGPoint(x: frame.midX, y: frame.midY)
        circle.glowWidth = 1.0
        circle.strokeColor = .black
        let body = SKPhysicsBody(edgeLoopFrom: circlePath.cgPath)
        body.isDynamic = true
        body.pinned = true
        circle.physicsBody = body
        addChild(circle)
    }
    
    func createCircle(){
        var circle = SKShapeNode(circleOfRadius: 50)
        var teste = SKLabelNode(text: "Teste")
        teste.fontSize = CGFloat(20)
        teste.fontName = "SFPro"
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: CGFloat(50),
//                                      startAngle: CGFloat(0),
//                                      endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circle.position = CGPoint(x: frame.midX, y: frame.midY)
        circle.glowWidth = 1.0
        circle.strokeColor = .black
        circle.fillColor = .red
        let body = SKPhysicsBody(circleOfRadius: 50)
        body.isDynamic = true
        body.pinned = false
        body.affectedByGravity = false
        body.mass = CGFloat(0.08)
        body.velocity = CGVector(dx: Int.random(in: 100...200), dy: Int.random(in: 100...200))
        body.restitution = 1
//        body.applyForce(CGVector(dx: Int.random(in: 500...600), dy: Int.random(in: 30...45)))
        circle.physicsBody = body
        addChild(circle)
        circle.addChild(teste)

        
    }
    

    
    func foi(nome: String){
        print(nome)
    }

    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        createCircle()
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


