//
//  GameScene.swift
//  GravityMaze
//
//  Created by Robert Szekely on 15/03/16.
//  Copyright (c) 2016 Robert Szekely. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let manager = CMMotionManager()
    
    override func didMoveToView(view: SKView) {
    //starting the accelerometer and we're going to grab the data from that and use it accordingly
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!), CGFloat((data?.acceleration.y)!))
        }
    
      
    }
    

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
