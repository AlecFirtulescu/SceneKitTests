//
//  GameViewController.swift
//  SceneKitTests
//
//  Created by Firtulescu Alexandru on 04/07/15.
//  Copyright (c) 2015 Firtulescu Alexandru. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scnView = self.view as! SCNView

        scnView.allowsCameraControl = true


        let scene = SCNScene()

        scnView.scene = scene
        scnView.backgroundColor = UIColor.redColor()

        let cameraNode = SCNNode()
        cameraNode.position = SCNVector3Make(0, 0, 10)
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)

        let node = Bullet(fireingPosition: SCNVector3Zero, speed: 0, targetPoint: SCNVector3Make(0, 1, 0))
        scene.rootNode.addChildNode(node)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
