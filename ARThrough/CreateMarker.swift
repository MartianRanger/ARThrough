//
//  CreateMarker.swift
//  ARThrough
//
//  Created by Julian Do on 4/10/19.
//  Copyright © 2019 Julian Do. All rights reserved.
//

import Foundation
import UIKit

public protocol CreateMarkerDelegate {
    func createMarker(_ cell: CreateMarker, answerTextDidChange text: String)
}
public class CreateMarker: UITableViewCell {
    
    public var delegate: CreateMarkerDelegate?
    //markerTitle = titleCell.text
    @IBOutlet weak var rules: UITextField!
    @IBOutlet public var indexLabel: UILabel!
}
extension CreateMarker {
    @IBAction func RuleChanged(_ textField: UITextField) {
        delegate?.createMarker(self, answerTextDidChange: textField.text!)
    }
}

extension CreateMarker: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
