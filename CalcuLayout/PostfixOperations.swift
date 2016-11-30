//
//  PostfixOperations.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 11/30/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

// MARK: Declarations


/// Makes number into LayoutModifier.
postfix operator ^

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints active. Note that this will take precedence over any deactivating operators.
postfix operator ^++

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints unactive. Note that active operators will take precedence over any activating operators.
postfix operator ^--



//MARK: POSTFIX OPERATIONS


/// Attached or later attached NSLayoutConstraints become active. Note that this will take precedence over any deactivating operators.
public postfix func ++ (constraint: NSLayoutConstraint) {
    constraint.isActive = true
}

/// Attached or later attached NSLayoutConstraints become active. Note that this will take precedence over any deactivating operators.
public postfix func ++ (anchor: Anchor) -> Anchor {
    let activatedAnchor = anchor
    activatedAnchor.autoActivateConstraints = true
    return activatedAnchor
}

/// Attached or later attached NSLayoutConstraints become active. Note that this will take precedence over any deactivating operators.
public postfix func ++ (modifier: LayoutModifier) -> LayoutModifier {
    let mod = modifier
    mod.attachedOperations.append(ConstraintFunction.activateConstraint(true))
    return mod
}

/// Attached or later attached NSLayoutConstraints become unactive. Note that active operators will take precedence over any activating operators.
public postfix func -- (constraint: NSLayoutConstraint) {
    constraint.isActive = false
}

/// Attached or later attached NSLayoutConstraints become unactive. Note that active operators will take precedence over any activating operators.
public postfix func -- (anchor: Anchor) -> Anchor {
    let activatedAnchor = anchor
    activatedAnchor.autoActivateConstraints = false
    return activatedAnchor
}

/// Attached or later attached NSLayoutConstraints become unactive. Note that active operators will take precedence over any activating operators.
public postfix func -- (modifier: LayoutModifier) -> LayoutModifier {
    let mod = modifier
    mod.attachedOperations.append(ConstraintFunction.activateConstraint(false))
    return mod
}


// MARK: Float


/// Makes number into LayoutModifier.
public postfix func ^ (modifier: Float) -> LayoutModifier {
    return modifier.C
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints active. Note that this will take precedence over any deactivating operators.
public postfix func ^++ (modifier: Float) -> LayoutModifier {
    return modifier.C++
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints unactive. Note that active operators will take precedence over any activating operators.
public postfix func ^-- (modifier: Float) -> LayoutModifier {
    return modifier.C--
}


// MARK: Double


/// Makes number into LayoutModifier.
public postfix func ^ (modifier: Double) -> LayoutModifier {
    return Float(modifier).C
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints active. Note that this will take precedence over any deactivating operators.
public postfix func ^++ (modifier: Double) -> LayoutModifier {
    return Float(modifier).C++
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints unactive. Note that active operators will take precedence over any activating operators.
public postfix func ^-- (modifier: Double) -> LayoutModifier {
    return Float(modifier).C--
}


// MARK: Int


/// Makes number into LayoutModifier.
public postfix func ^ (modifier: Int) -> LayoutModifier {
    return Float(modifier).C
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints active. Note that this will take precedence over any deactivating operators.
public postfix func ^++ (modifier: Int) -> LayoutModifier {
    return Float(modifier).C++
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints unactive. Note that active operators will take precedence over any activating operators.
public postfix func ^-- (modifier: Int) -> LayoutModifier {
    return Float(modifier).C--
}


// MARK: CGFloat


/// Makes number into LayoutModifier.
public postfix func ^ (modifier: CGFloat) -> LayoutModifier {
    return Float(modifier).C
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints active. Note that this will take precedence over any deactivating operators.
public postfix func ^++ (modifier: CGFloat) -> LayoutModifier {
    return Float(modifier).C++
}

/// Combination. Make number into Layout Modifier and makes attached (or later attached) NSLayoutConstraints unactive. Note that active operators will take precedence over any activating operators.
public postfix func ^-- (modifier: CGFloat) -> LayoutModifier {
    return Float(modifier).C--
}
