//
//  Marker.swift
//  Test
//
//  Created by Julian Do on 4/22/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import Foundation
import ARKit
import UIKit

public class Marker {
    //var markerIndex: String
    var markerTitle: String
    var images: [UIImage]
    var imageAnchor: ARAnchor
    
    init (title: String, anchor: ARAnchor, image: [UIImage])
    {
        self.markerTitle = title
        self.images = image
        self.imageAnchor = anchor
    }
}
public class MarkerGroup {
    var title: String
    var marker: [Marker]
    //var score: int2
    
    init (title: String, imageMarker: [Marker])
    {
        self.title = title
        self.marker = imageMarker
    }
}
