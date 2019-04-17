//
//  CreateMarkerViewController.swift
//  ARThrough
//
//  Created by Julian Do on 4/8/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import Foundation
import UIKit

public class CreateMarkerViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var StartAR: UIButton!
    public let markerGroupBuilder = MarkerGroupBuilder()
    var marker: MarkerGroup
    
    init(arMarker: MarkerGroup)
    {
        marker = arMarker
    }
    
    @IBAction func savePressed(_ sender: Any) {
        do {
            let markerGroup = try markerGroupBuilder.build()
            //delegate?.CreateMarkerViewController(
             //   self, created: MarkerGroup)
        } catch {
            //displayMissingInputsAlert()
        }
    
    }
    /*public func createMarker() {
        titleText.text = markerGroup.title
    }*/
}
