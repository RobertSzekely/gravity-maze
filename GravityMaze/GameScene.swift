//
//  GameScene.swift
//  GravityMaze
//
//  Created by Robert Szekely on 15/03/16.
//  Copyright (c) 2016 Robert Szekely. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNone = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        
        player = self.childNodeWithName("player") as! SKSpriteNode
        
        endNone = self.childNodeWithName("endNode") as! SKSpriteNode
        
        //starting the accelerometer and we're going to grab the data from that and use it accordingly
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 10, CGFloat((data?.acceleration.y)!) * 10)
        }
    
      
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            //EndScene
            print("You won!")
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
