//
//  NSLayoutConstraint+CalcuLayout.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import Foundation

public extension NSLayoutConstraint {
    internal func runAttachedOperations(operations: [ConstraintFunction]) -> NSLayoutConstraint {
        let modifiedConstraint = self
        
        for function in operations {
            switch function {
            case .AddConstant(let constant):
                // How to get saved float?
                modifiedConstraint + constant^
                break
            case .SubtractConstant(let constant):
                modifiedConstraint - constant^
                break
            case .MultiplyConstant(let constant):
                modifiedConstraint * constant^
                break
            case .DivideConstant(let constant):
                modifiedConstraint / constant^
                break
            case .ActivateConstraint(let isActive):
                modifiedConstraint.active = isActive
                break
            }
            
        }
//        var view = self.firstItem as? UIView
//        view?.layoutIfNeeded()
        return modifiedConstraint
    }
}