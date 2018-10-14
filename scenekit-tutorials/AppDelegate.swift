//
//  AppDelegate.swift
//  scenekit-tutorials
//
//  Created by Michael Wu on 8/26/18.
//  Copyright © 2018 michaelwu. All rights reserved.
//

import Cocoa
import SceneKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: SCNView!
    override func awakeFromNib() {
        let scene = SCNScene()
        let boxSide: CGFloat = 10.0
        let box = SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0)

        let boxNode = SCNNode(geometry: box)
        scene.rootNode.addChildNode(boxNode)

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 10, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -atan2(10.0, 20.0))
        scene.rootNode.addChildNode(cameraNode)

        let lightBlueColor = NSColor(calibratedRed: 4.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let light = SCNLight()
        light.type = SCNLight.LightType.directional
        light.color = lightBlueColor
        let lightNode = SCNNode()
        lightNode.light = light
        cameraNode.addChildNode(lightNode)

        window.scene = scene

    }
}
