//
//  NSLayoutConstraint+CalcuLayout.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

/// This extension allows for all the attached LayoutModifiers to affect the NSLayoutConstraint.
public extension NSLayoutConstraint {
    
    /// All the attached LayoutModifiers will affect the NSLayoutConstraint.
    internal func runAttachedOperations(_ operations: [ConstraintFunction]) -> NSLayoutConstraint {
        var modifiedConstraint = NSLayoutConstraint()
        
        for function in operations {
            switch function {
            case .addConstant(let constant):
                modifiedConstraint = self + constant^
                break
            case .subtractConstant(let constant):
                modifiedConstraint = self - constant^
                break
            case .multiplyConstant(let constant):
                modifiedConstraint = self * constant^
                break
            case .divideConstant(let constant):
                modifiedConstraint = self / constant^
                break
            case .activateConstraint(let isActive):
                self.isActive = isActive
                break
            }
        }
        
        return modifiedConstraint
    }
}
