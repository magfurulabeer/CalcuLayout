//
//  Anchor.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

open class Anchor {
    open var view: UIView
    open var attribute: NSLayoutAttribute = NSLayoutAttribute.notAnAttribute
    open var autoActivateConstraints = false
    
    public init(view: UIView, attribute: NSLayoutAttribute) {
        self.attribute = attribute
        self.view = view
    }
}
