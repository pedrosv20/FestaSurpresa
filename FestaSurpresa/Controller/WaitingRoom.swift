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
        
//        view.showsNodeCount = true
        self.backgroundColor = UIColor.clear
//        let circle = childNode(withName: "circle") as? SKSpriteNode
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: CGFloat(300), startAngle: CGFloat(0),
                                      endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circle.position = CGPoint(x: frame.midX, y: frame.midY)
        circle.glowWidth = 1.0
        circle.strokeColor = .white
        circle.fillColor = #colorLiteral(red: 0.9725490196, green: 0.8156862745, blue: 0.3333333333, alpha: 1)
        let body = SKPhysicsBody(edgeLoopFrom: circlePath.cgPath)
        body.isDynamic = true
        body.pinned = true
        body.restitution = 1.25
        body.friction = 0.0
        circle.physicsBody = body
        addChild(circle)
    }
    
    func createCircle(){
        var circle = SKShapeNode(circleOfRadius: 50)
//        var namePlayer = SKLabelNode(text: name)
//        namePlayer.fontSize = CGFloat(20)
//        namePlayer.fontName = "SFPro"
//        namePlayer.fontColor = .black
        
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: CGFloat(50),
//                                      startAngle: CGFloat(0),
//                                      endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circle.position = CGPoint(x: frame.midX, y: frame.midY)
        circle.glowWidth = 1.0
        circle.strokeColor = .black
        circle.fillColor = #colorLiteral(red: 1, green: 0.9254901961, blue: 0.6941176471, alpha: 1)
        circle.strokeColor = .white
        let body = SKPhysicsBody(circleOfRadius: 50)
        body.isDynamic = true
        body.pinned = false
        body.affectedByGravity = false
        body.mass = CGFloat(0.8)
        body.velocity = CGVector(dx: Int.random(in: -200...200), dy: Int.random(in: -200...200))
        body.restitution = 0.3
        body.friction = 0.0
//        body.applyForce(CGVector(dx: Int.random(in: 500...600), dy: Int.random(in: 30...45)))
        circle.physicsBody = body
        addChild(circle)
//        circle.addChild(namePlayer)
        
    }
    
    
    

    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        createCircle()
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


