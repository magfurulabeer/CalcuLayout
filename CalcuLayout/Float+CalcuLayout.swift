//
//  Float+CalcuLayout.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

/// This extension adds .C and .M as quick ways to make Floats into LayoutConstraints. While C and M stand for Constant and Multiplier, they are exactly the same and only exist for readability.
extension Float {

    /// Creates a Constant LayoutModifier from the Float.
    public var C: LayoutModifier {
        get {
            return LayoutModifier(value: self)
        }
    }
    
    /// Creates a Multiplier LayoutModifier from the Float.
    public var M: LayoutModifier {
        get {
            return LayoutModifier(value: self)
        }
    }
    
    
}
