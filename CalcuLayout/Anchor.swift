//
//  Anchor.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

/// A wrapper around NSLayoutAttribute that acts like an NSLayoutAnchor.
open class Anchor {
    
    /// The view that this anchor belongs to.
    open var view: UIView
    
    /// The actual NSLayoutAttribute underneath.
    open var attribute: NSLayoutAttribute = NSLayoutAttribute.notAnAttribute
    
    /// Represents whether or not to activate NSLayoutConstraint made with this anchor.
    open var autoActivateConstraints = false
    
    /**
     Initializes a new Anchor with the provided specifications.
     
     - Parameters:
        - view: The view that this anchor belongs to.
        - attribute: The actual NSLayoutAttribute underneath.
     
     - Returns: An anchor ready to be constrained to.
     */
    public init(view: UIView, attribute: NSLayoutAttribute) {
        self.attribute = attribute
        self.view = view
    }
}
