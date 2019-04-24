//
//  PreviewViewController.swift
//  Test
//
//  Created by Julian Do on 4/23/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import Foundation
import UIKit

class PreviewViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = self.image
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButton_touchUpInside( sender: Any) {
        //Code
    }
}
