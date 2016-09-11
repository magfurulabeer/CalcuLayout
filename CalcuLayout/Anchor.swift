//
//  Anchor.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

public class Anchor {
    public var view: UIView
    public var attribute: NSLayoutAttribute = NSLayoutAttribute.NotAnAttribute
    public var autoActivateConstraints = false
    
    public init(view: UIView, attribute: NSLayoutAttribute) {
        self.attribute = attribute
        self.view = view
    }
}