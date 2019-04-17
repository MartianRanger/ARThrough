//
//  ViewController.swift
//  ARThrough
//
//  Created by Julian Do on 4/4/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    /*@IBOutlet var sceneView: ARSCNView!
        var didInitializeScene: Bool = false
        //var sceneController = HoverScene()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sceneView.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTapScreen))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
    }
    @objc func didTapScreen(recognizer: UITapGestureRecognizer)
    {
        if didInitializeScene, let camera = sceneView.session.currentFrame?.camera {
            let tapLocation = recognizer.location(in: sceneView)
            let hitTestResults = sceneView.hitTest(tapLocation)
            /*if let node = hitTestResults.first?.node, let scene = sceneController.scene, let sphere = node.topmost(until: scene.rootNode) as? Marker {
                sphere.animate()
            }
            else {
                var translation = matrix_identity_float4x4
                translation.columns.3.z = -5.0
                let transform = camera.transform * translation
                let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
                //sceneController.addSphere(position: position)
            }*/
        }
    }
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        return node
    }
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if let camera = sceneView.session.currentFrame?.camera {
            didInitializeScene = true
            
            let transform = camera.transform
            let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
            //sceneController.makeUpdateCameraPos(towards: position)
        }
}*/
 
    @IBOutlet weak var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = [.horizontal, .vertical]
        
        sceneView.session.run(configuration)
        
    }
    @objc func tapped(recognizer :UITapGestureRecognizer) {
        let sceneView = recognizer.view as! ARSCNView
        let touchLocation = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(touchLocation, options: [:])
        if !hitResults.isEmpty {
            // this means the node has been touched
        }
    }
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touch = touches.first {
            // ...
        }
        super.touchesBegan(touches, with: event)
    }*/
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?
    {
        let node = SCNNode()
        
        if let objectAnchor = anchor as? ARObjectAnchor
        {
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width * 0.125
            
            let displayScene = SKScene(fileNamed: "marker")
            plane.firstMaterial?.diffuse.contents = displayScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1,-1,1), 0, 1, 0)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)
            
            node.addChildNode(planeNode)
        }
        return node
    }
}
