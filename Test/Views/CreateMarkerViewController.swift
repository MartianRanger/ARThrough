//
//  CreateMarkerViewController.swift
//  Test
//
//  Created by Julian Do on 4/22/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import Foundation
import UIKit
public protocol CreateMarkerGroupViewControllerDelegate {
    func createMarkerGroupViewControllerDidCancel(_ viewController: CreateMarkerViewController)
    
    func createQuestionGroupViewController(_ viewController: CreateMarkerViewController,
                                           created markerGroup: MarkerGroup)
}
public class CreateMarkerViewController: UIViewController {
    @IBOutlet weak var savePhoto: UIButton!
    
        @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var finishMarkers: UIButton!
    @IBOutlet weak var StartAR: UIButton!
    public let markerGroupBuilder = MarkerGroupBuilder()
    var marker : Marker!
    //TransitionView
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ARView(_ sender: Any) {
        let title: String = titleText.text!
        if (title.isEmpty) {
            displayMissingInputsAlert()
        }
    }
        /*func addMarker() {
        markerGroupBuilder.addNewMarker()
    }*/
    @IBAction func savePhoto(_ sender: Any) {
        let image = photo.image
        marker.images.append(image!)
    }
    
    @IBAction func createMarkers(_ sender: Any) {
        do {
            let markerGroup = try markerGroupBuilder.build()
            markerGroup.title = titleText.text!
            //delegate?.CreateMarkerViewController(
            //self, created: MarkerGroup)
        } catch {
            //displayMissingInputsAlert()
        }
    }
    public func displayMissingInputsAlert() {
         let alert = UIAlertController(
         title: "Missing Title",
         message: "Please make a title. We're begging you.",
         preferredStyle: .alert)
     
         let okAction = UIAlertAction(title: "Ok",
         style: .default,
         handler: nil)
         alert.addAction(okAction)
    }
}
