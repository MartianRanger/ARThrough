//
//  MarkerBuilder.swift
//  ARThrough
//
//  Created by Julian Do on 4/8/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import AVFoundation
public class MarkerGroupBuilder {
    
    public var markers = [MarkerBuilder()]
    public var title = ""
    //init()
    //{
        //
    //}
    public func addNewMarker() {
        let marker = MarkerBuilder()
        
        markers.append(marker)
    }
    
    public func build() throws -> MarkerGroup {
        guard self.title.count > 0 else { throw Error.missingTitle }
        guard self.markers.count > 0 else { throw Error.missingMarkers }
        let markers = try self.markers.map { try $0.build() }
        return MarkerGroup(title: title, imageMarker: markers)
    }
    
    public enum Error: String, Swift.Error {
        case missingTitle
        case missingMarkers
    }
}
public class MarkerBuilder {
    
    public var images: [UIImage]
    public var imageAnchor: ARAnchor
    
    init()
    {
        
    }
    public func build() throws -> Marker {
        guard images.count > 0 else { throw Error.missingImages }
        //guard.self.title.count > 0 else { }
        //guard.self.rules.count > 0 else {}
        return Marker(anchor: imageAnchor, image: images)
    }
    public enum Error: String, Swift.Error {
        case missingImages
    }
}
