//
//  LayoutModifier.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

/// A wrapper around numbers that allows for retaining other layout modifiers through attaching their respective operations.
open class LayoutModifier {
    
    /// The actual number underneath.
    open var value: Float
    
    /// All the other layout modifiers
    open var attachedOperations = [ConstraintFunction]()
    
    /**
     Initializes a new LayoutModifier with the provided value.
     
     - Parameters:
     - value: The actual number underneath.
     
     - Returns: A LayoutModifier object representing the given value.
     */
    init(value: Float) {
        self.value = value
    }
}
