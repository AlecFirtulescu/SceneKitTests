//
//  Bullet.swift
//  SpaceInvaders
//
//  Created by Firtulescu Alexandru on 25/06/15.
//  Copyright © 2015 Firtulescu Alexandru. All rights reserved.
//

import UIKit
import SceneKit

class Bullet: SCNNode {

    var value = 0

    init(fireingPosition: SCNVector3!,speed: Double ,targetPoint:SCNVector3!) {
        super.init()
        self.name                           = "bulletNode"
        self.geometry                       = setSelfGeometry()
        self.position                       = fireingPosition
        moveBulletTotarget(targetPoint, withSpeed: speed)
        //removeFromScene(speed)
        addGlow()
    }

    func setSelfGeometry() -> SCNGeometry {
        let geo = SCNCapsule(capRadius: 0.5, height: 2)
        return geo
    }

    func moveBulletTotarget(targetPoint:SCNVector3!, withSpeed speed:Double) {
        let action = SCNAction.moveTo(targetPoint, duration: speed)
        self.runAction(action)
    }

    func removeFromScene(after:Double) {
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * after))
        dispatch_after(delay, dispatch_get_main_queue(), {
            self.removeFromParentNode()
        })
    }

    func setSelfProprietes() {
        //TODO: implement method
        self.physicsBody                    = SCNPhysicsBody(type: SCNPhysicsBodyType.Kinematic, shape: SCNPhysicsShape(geometry: self.geometry!, options: nil))
        self.physicsBody?.categoryBitMask   = 1
    }

    func addGlow() {
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(120, forKey: kCIInputRadiusKey)
        //filter.setDefaults()
        self.filters = [filter]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
