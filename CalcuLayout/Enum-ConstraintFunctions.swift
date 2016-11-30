//
//  Enum-ConstraintFunctions.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

/**
    An enum that represents the appropriate functions. It's purpose is to put said functions in a collection.

    - addConstant: Given constraint will be added to the constant value of the NSLayoutConstraint.
    - subtractConstant: Given constraint will be subtracted from the constant value of the NSLayoutConstraint.
    - multiplyConstant: Given constraint will be multiply the multiplier value of the NSLayoutConstraint.
    - divideConstant: Given constraint will divide the multiplier value of the NSLayoutConstraint.
    - activateConstraint: Attached NSLayoutConstraints will be activated.
 */
public enum ConstraintFunction {
    case addConstant (Float)
    case subtractConstant (Float)
    case multiplyConstant (Float)
    case divideConstant (Float)
    case activateConstraint (Bool)
}
