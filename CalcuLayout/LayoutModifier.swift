//
//  LayoutModifier.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

public class LayoutModifier {
    public var value: Float
    public var attachedOperations = [ConstraintFunction]()
    
    init(value: Float) {
        self.value = value
    }
}