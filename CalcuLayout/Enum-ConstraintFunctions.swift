//
//  Enum-ConstraintFunctions.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

public enum ConstraintFunction {
    case AddConstant (Float)
    case SubtractConstant (Float)
    case MultiplyConstant (Float)
    case DivideConstant (Float)
    case ActivateConstraint (Bool)
}