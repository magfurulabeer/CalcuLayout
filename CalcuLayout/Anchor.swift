//
//  Anchor.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

public class Anchor {
    
    public var view: UIView
    public var attribute: NSLayoutAttribute = NSLayoutAttribute.NotAnAttribute
    public var autoActivateConstraints = false
    
    public init(view: UIView, attribute: NSLayoutAttribute) {
        self.attribute = attribute
        self.view = view
    }
}

/*


public func + (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    firstModifier.attachedOperations.append(ConstraintFunction.AddConstant(secondModifier.value))
    firstModifier.attachedOperations += secondModifier.attachedOperations
    return firstModifier
}

public func - (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    firstModifier.attachedOperations.append(ConstraintFunction.SubtractConstant(secondModifier.value))
    firstModifier.attachedOperations += secondModifier.attachedOperations
    return firstModifier
}

public func * (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    firstModifier.attachedOperations.append(ConstraintFunction.MultiplyConstant(secondModifier.value))
    firstModifier.attachedOperations += secondModifier.attachedOperations
    return firstModifier
}

public func / (firstModifier: LayoutModifier, secondModifier: LayoutModifier) -> LayoutModifier {
    firstModifier.attachedOperations.append(ConstraintFunction.DivideConstant(secondModifier.value))
    firstModifier.attachedOperations += secondModifier.attachedOperations
    return firstModifier
}

*/