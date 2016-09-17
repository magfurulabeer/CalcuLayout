//
//  Enum-ConstraintFunctions.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

public enum ConstraintFunction {
    case addConstant (Float)
    case subtractConstant (Float)
    case multiplyConstant (Float)
    case divideConstant (Float)
    case activateConstraint (Bool)
}
