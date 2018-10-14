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
        box.firstMaterial?.diffuse.contents = NSColor.blue
        box.firstMaterial?.specular.contents = NSColor.white
        box.firstMaterial?.locksAmbientWithDiffuse = true

        let boxNode = SCNNode(geometry: box)
        scene.rootNode.addChildNode(boxNode)

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(5, 0, 20)
        scene.rootNode.addChildNode(cameraNode)

        let light = SCNLight()
        light.type = SCNLight.LightType.spot
        light.color = NSColor.white
        light.spotInnerAngle = 120
        light.spotOuterAngle = 170
        let lightNode = SCNNode()
        lightNode.light = light
        cameraNode.addChildNode(lightNode)

        let ambientLight = SCNLight()
        ambientLight.type = SCNLight.LightType.ambient
        ambientLight.color = NSColor.white
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        scene.rootNode.addChildNode(ambientLightNode)

        window.scene = scene
    }
}
