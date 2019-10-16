//
//  GameScene.swift
//  Project 11 - Pachinko
//
//  Created by Sean Williams on 16/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        // ignore alpha values
        background.blendMode = .replace
        //Draw behind everything else
        background.zPosition = -1
        addChild(background)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = CGPoint(x: 512, y: 0)
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
        // False means it will collide with other things but is fixed in position
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let ball = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        //Bouncyness
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
        
        
        
//        let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
//        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
//        box.position = location
//        addChild(box)
    }

}
