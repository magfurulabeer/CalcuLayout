//
//  InfixOperations.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 11/30/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

// TODO: Add >= and <= Anchor to Modifiers
// TODO: Add ^ for Doubles and Ints


// MARK: Declarations

precedencegroup ConstraintPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

/// Practically equivalent to constraintEqualToAnchor.
infix operator <> : ConstraintPrecedence

/// Practically equivalent to constraintGreaterThanOrEqualToAnchor.
infix operator >> : ConstraintPrecedence

/// Practically equivalent to constraintLessThanOrEqualToAnchor.
infix operator << : ConstraintPrecedence



// MARK: Operators



public func += (view: UIView, anchor: Anchor) -> NSLayoutConstraint {
    let constraint = NSLayoutConstraint(item: view,
                                        attribute: anchor.attribute,
                                        relatedBy: .equal,
                                        toItem: anchor.view,
                                        attribute: anchor.attribute,
                                        multiplier: 1,
                                        constant: 0)
    constraint.isActive = true
    return constraint
}

public func += (view: UIView, anchors: [Anchor]) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    for anchor in anchors {
        let constraint = (view += anchor)
        constraints.append(constraint)
    }
    return constraints
}



// MARK: Anchor Operators



/// Practically equivalent to constraintEqualToAnchor. Discouraged to use this due to == usually being used for comparison.
public func == (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    firstAnchor.view.translatesAutoresizingMaskIntoConstraints = false
    let constraint = NSLayoutConstraint(item: firstAnchor.view,
                                        attribute: firstAnchor.attribute,
                                        relatedBy: .equal,
                                        toItem: secondAnchor.view,
                                        attribute: secondAnchor.attribute,
                                        multiplier: 1,
                                        constant: 0)
    constraint.isActive = (firstAnchor.autoActivateConstraints || secondAnchor.autoActivateConstraints) ? true: false
    return constraint
}

/// Practically equivalent to constraintEqualToAnchor
public func <> (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    return firstAnchor == secondAnchor
}

/// Practically equivalent to constraintEqualToAnchor. Discouraged to use this due to == usually being used for comparison.
public func == (firstAnchor: Anchor, constant: LayoutModifier) -> NSLayoutConstraint {
    firstAnchor.view.translatesAutoresizingMaskIntoConstraints = false
    var constraint = NSLayoutConstraint(item: firstAnchor.view,
                                        attribute: firstAnchor.attribute,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: NSLayoutAttribute.notAnAttribute,
                                        multiplier: 1,
                                        constant: CGFloat(constant.value))
    constraint = constraint.runAttachedOperations(constant.attachedOperations)
    return constraint
}

/// Practically equivalent to constraintEqualToAnchor.
public func <> (firstAnchor: Anchor, constant: LayoutModifier) -> NSLayoutConstraint {
    return firstAnchor == constant
}

/// Practically equivalent to constraintGreaterThanOrEqualToAnchor. Discouraged to use this due to >= usually being used for comparison.
public func >= (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    
    let constraint = NSLayoutConstraint(item: firstAnchor.view,
                                        attribute: firstAnchor.attribute,
                                        relatedBy: .greaterThanOrEqual,
                                        toItem: secondAnchor.view,
                                        attribute: secondAnchor.attribute,
                                        multiplier: 1,
                                        constant: 0)
    constraint.isActive = (firstAnchor.autoActivateConstraints || secondAnchor.autoActivateConstraints) ? true: false
    return constraint
}

/// Practically equivalent to constraintGreaterThanOrEqualToAnchor.
public func >> (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    
    return firstAnchor >= secondAnchor
}

/// Practically equivalent to constraintLessThanOrEqualToAnchor. Discouraged to use this due to <= usually being used for comparison.
public func <= (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    
    let constraint = NSLayoutConstraint(item: firstAnchor.view,
                                        attribute: firstAnchor.attribute,
                                        relatedBy: .lessThanOrEqual,
                                        toItem: secondAnchor.view,
                                        attribute: secondAnchor.attribute,
                                        multiplier: 1,
                                        constant: 0)
    constraint.isActive = (firstAnchor.autoActivateConstraints || secondAnchor.autoActivateConstraints) ? true: false
    return constraint
}

/// Practically equivalent to constraintLessThanOrEqualToAnchor.
public func << (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    return firstAnchor <= secondAnchor
}



// MARK: NSLayoutConstraint-LayoutModifier Operators



/// Adds LayoutModifier to NSLayoutConstraints constant value. Also adds all other attached LayoutModifiers and Activators.
public func + (constraint: NSLayoutConstraint, constant: LayoutModifier) -> NSLayoutConstraint {
    var newConstraint = NSLayoutConstraint(item: constraint.firstItem,
                                           attribute: constraint.firstAttribute,
                                           relatedBy: constraint.relation,
                                           toItem: constraint.secondItem,
                                           attribute: constraint.secondAttribute,
                                           multiplier: constraint.multiplier,
                                           constant: constraint.constant + CGFloat(constant.value) )
    newConstraint = newConstraint.runAttachedOperations(constant.attachedOperations)
    return newConstraint
}

/// Subtracts LayoutModifier from NSLayoutConstraints constant value. Also adds all other attached LayoutModifiers and Activators.
public func - (constraint: NSLayoutConstraint, constant: LayoutModifier) -> NSLayoutConstraint {
    var newConstraint = NSLayoutConstraint(item: constraint.firstItem,
                                           attribute: constraint.firstAttribute,
                                           relatedBy: constraint.relation,
                                           toItem: constraint.secondItem,
                                           attribute: constraint.secondAttribute,
                                           multiplier: constraint.multiplier,
                                           constant: constraint.constant - CGFloat(constant.value) )
    newConstraint = newConstraint.runAttachedOperations(constant.attachedOperations)
    return newConstraint
}

/// Multiplies NSLayoutConstraints multiplier by LayoutModifier value. Also adds all other attached LayoutModifiers and Activators.
public func * (constraint: NSLayoutConstraint, multiplier: LayoutModifier) -> NSLayoutConstraint {
    var newConstraint = NSLayoutConstraint(item: constraint.firstItem,
                                           attribute: constraint.firstAttribute,
                                           relatedBy: constraint.relation,
                                           toItem: constraint.secondItem,
                                           attribute: constraint.secondAttribute,
                                           multiplier: constraint.multiplier * CGFloat(multiplier.value),
                                           constant: constraint.constant )
    newConstraint = newConstraint.runAttachedOperations(multiplier.attachedOperations)
    return newConstraint
}

/// Divides NSLayoutConstraints multiplier by LayoutModifier value. Also adds all other attached LayoutModifiers and Activators.
public func / (constraint: NSLayoutConstraint, multiplier: LayoutModifier) -> NSLayoutConstraint {
    var newConstraint = NSLayoutConstraint(item: constraint.firstItem,
                                           attribute: constraint.firstAttribute,
                                           relatedBy: constraint.relation,
                                           toItem: constraint.secondItem,
                                           attribute: constraint.secondAttribute,
                                           multiplier: constraint.multiplier / CGFloat(multiplier.value),
                                           constant: constraint.constant )
    newConstraint = newConstraint.runAttachedOperations(multiplier.attachedOperations)
    return newConstraint
}



// MARK: LayoutModifier-LayoutModifier Operators


/// Stores second LayoutModifer(as an addConstant) and attached operations in First Modifier
public func + (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.addConstant(secondModifier.value))
    
}

/// Stores second LayoutModifer(as an subtractConstant) and attached operations in First Modifier
public func - (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.subtractConstant(secondModifier.value))
    
}

/// Stores second LayoutModifer(as an multiplyConstant) and attached operations in First Modifier
public func * (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.multiplyConstant(secondModifier.value))
    
}

/// Stores second LayoutModifer(as an divideConstant) and attached operations in First Modifier
public func / (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.divideConstant(secondModifier.value))
}

/// Adds appropriate Operation to firstModifier.
private func operation(_ firstModifier: LayoutModifier, secondModifier: LayoutModifier, function: ConstraintFunction) -> LayoutModifier {
    firstModifier.attachedOperations.append(function)
    firstModifier.attachedOperations += secondModifier.attachedOperations
    return firstModifier
}
