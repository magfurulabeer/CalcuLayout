//
//  Operations.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

// MARK: Declarations

// Setting Postfix Operators
postfix operator ^
postfix operator ^++
postfix operator ^--

precedencegroup ConstraintPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}
// Setting Constraint Operators
infix operator <> : ConstraintPrecedence
infix operator >> : ConstraintPrecedence
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
// TODO: Add >= and <= Anchor to Modifiers
// TODO: Add ^ for Doubles and Ints

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

public func <> (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    return firstAnchor == secondAnchor
}

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

public func <> (firstAnchor: Anchor, constant: LayoutModifier) -> NSLayoutConstraint {
    return firstAnchor == constant
}

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

public func >> (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    
    return firstAnchor >= secondAnchor
}

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

public func << (firstAnchor: Anchor, secondAnchor: Anchor) -> NSLayoutConstraint {
    return firstAnchor <= secondAnchor
}

// MARK: NSLayoutConstraint Operators

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

public func + (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.addConstant(secondModifier.value))

}

public func - (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.subtractConstant(secondModifier.value))

}

public func * (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.multiplyConstant(secondModifier.value))

}

public func / (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    return operation(firstModifier, secondModifier: secondModifier, function: ConstraintFunction.divideConstant(secondModifier.value))
}

private func operation(_ firstModifier: LayoutModifier, secondModifier: LayoutModifier, function: ConstraintFunction) -> LayoutModifier {
    firstModifier.attachedOperations.append(function)
    firstModifier.attachedOperations += secondModifier.attachedOperations
    return firstModifier
}



//MARK: POSTFIX OPERATIONS


public postfix func ++ (constraint: NSLayoutConstraint) {
    constraint.isActive = true
}

public postfix func ++ (anchor: Anchor) -> Anchor {
    let activatedAnchor = anchor
    activatedAnchor.autoActivateConstraints = true
    return activatedAnchor
}

public postfix func ++ (modifier: LayoutModifier) -> LayoutModifier {
    let mod = modifier
    mod.attachedOperations.append(ConstraintFunction.activateConstraint(true))
    return mod
}

public postfix func -- (constraint: NSLayoutConstraint) {
    constraint.isActive = false
}

public postfix func -- (anchor: Anchor) -> Anchor {
    let activatedAnchor = anchor
    activatedAnchor.autoActivateConstraints = false
    return activatedAnchor
}

public postfix func -- (modifier: LayoutModifier) -> LayoutModifier {
    let mod = modifier
    mod.attachedOperations.append(ConstraintFunction.activateConstraint(false))
    return mod
}

public postfix func ^ (modifier: Float) -> LayoutModifier {
    return modifier.C
}

public postfix func ^++ (modifier: Float) -> LayoutModifier {
    return modifier.C++
}

public postfix func ^-- (modifier: Float) -> LayoutModifier {
    return modifier.C--
}

public postfix func ^ (modifier: Double) -> LayoutModifier {
    return Float(modifier).C
}

public postfix func ^++ (modifier: Double) -> LayoutModifier {
    return Float(modifier).C++
}

public postfix func ^-- (modifier: Double) -> LayoutModifier {
    return Float(modifier).C--
}

public postfix func ^ (modifier: Int) -> LayoutModifier {
    return Float(modifier).C
}

public postfix func ^++ (modifier: Int) -> LayoutModifier {
    return Float(modifier).C++
}

public postfix func ^-- (modifier: Int) -> LayoutModifier {
    return Float(modifier).C--
}

public postfix func ^ (modifier: CGFloat) -> LayoutModifier {
    return Float(modifier).C
}

public postfix func ^++ (modifier: CGFloat) -> LayoutModifier {
    return Float(modifier).C++
}

public postfix func ^-- (modifier: CGFloat) -> LayoutModifier {
    return Float(modifier).C--
}








