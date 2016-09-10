//
//  LayoutModifier.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

public class LayoutModifier {
    var value: Float
    var attachedOperations = [ConstraintFunction]()
    
    init(value: Float) {
        self.value = value
    }
}

