//
//  LayoutModifier.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

open class LayoutModifier {
    open var value: Float
    open var attachedOperations = [ConstraintFunction]()
    
    init(value: Float) {
        self.value = value
    }
}
