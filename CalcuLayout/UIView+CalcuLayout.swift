//
//  UIView+CalcuLayout.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit


public func += (view: UIView, anchor: Anchor) -> Constraint? {
//    view.topAnchor.
    
    var constraint = NSLayoutConstraint(item: view,
                                        attribute: anchor.attribute,
                                        relatedBy: Equal,
                                        toItem: anchor.v,
                                        attribute: anchor.attribute,
                                        multiplier: 1,
                                        constant: 0)
    // Translates Auto Constraints to false?
//    let xAnchorTypes = [AnchorType.Leading, AnchorType.Trailing, AnchorType.CenterX]
//    let yAnchorTypes = [AnchorType.Top, AnchorType.Bottom, AnchorType.CenterY]
//    let dimensionTypes = [AnchorType.Height, AnchorType.Width]
    let viewAnchor = view.anchorOfType(anchor.type)
//    if let viewAnchor = viewAnchor {
//        var constraint = Constraint()
//        if xAnchorTypes.contains(viewAnchor.type) {
//            let xAnchor = viewAnchor as! XAnchor
//            constraint = xAnchor.constraintEqualToAnchor(anchor as! XAnchor) as! Constraint
//        } else if yAnchorTypes.contains(viewAnchor.type) {
//            let yAnchor = viewAnchor as! YAnchor
//            constraint = yAnchor.constraintEqualToAnchor(anchor as! YAnchor) as! Constraint
//        } else if dimensionTypes.contains(viewAnchor.type) {
//            let dimension = viewAnchor as! Dimension
//            constraint = dimension.constraintEqualToAnchor(anchor as! Dimension) as! Constraint
//        }
////        constraint.active = true
//        return constraint
//    }
    return nil
}

public func += (view: UIView, anchors: [Anchor]) -> [Constraint]? {
    var constraints = [Constraint]()
    for anchor in anchors {
        if let constraint = (view += anchor) {
            constraints.append(constraint)
        } else {
            return nil
        }
    }
    return constraints
}



public extension UIView {
    
    public func anchorOfType(type: AnchorType) -> Anchor? {
        let anchor: Anchor?
        switch type {
        case .Top:
            anchor = topAnchor as? YAnchor
            anchor!.type = .Top
        case .Bottom:
            anchor = bottomAnchor as? YAnchor
            anchor!.type = .Bottom
        case .CenterY:
            anchor = centerYAnchor as? YAnchor
            anchor!.type = .CenterY
        case .Leading:
            anchor = leadingAnchor as? XAnchor
            anchor!.type = .Leading
        case .Trailing:
            anchor = trailingAnchor as? XAnchor
            anchor!.type = .Trailing
        case .CenterX:
            anchor = centerXAnchor as? XAnchor
            anchor!.type = .CenterX
        case .Height:
            anchor = heightAnchor as? Dimension
            anchor!.type = .Height
        case .Width: 
            anchor = widthAnchor as? Dimension
            anchor!.type = .Width
            
        default:
            anchor = nil
        }
        return anchor
    }
    
    public var leading: XAnchor {
        get {
            let anchor = self.leadingAnchor as! XAnchor
            anchor.type = AnchorType.Leading
            return anchor
        }
    }
    
    public var trailing: XAnchor {
        get {
            let anchor = self.trailingAnchor as! XAnchor
            anchor.type = AnchorType.Trailing
            return anchor
        }
    }
    
    public var centerX: XAnchor {
        get {
//            let anchor = XAnchor(self.centerXAnchor) 
            let anchor = self.centerXAnchor as! XAnchor
            anchor.type = AnchorType.CenterX
            return anchor
        }
    }
    
    public var top: YAnchor {
        get {
            let anchor = self.topAnchor as! YAnchor
            anchor.type = AnchorType.Top
            return anchor
        }
    }
    
    public var bottom: YAnchor {
        get {
            let anchor = self.bottomAnchor as! YAnchor
            anchor.type = AnchorType.Bottom
            return anchor
        }
    }
    
    public var centerY: YAnchor {
        get {
            let anchor = self.centerYAnchor as! YAnchor
            anchor.type = AnchorType.CenterY
            return anchor
        }
    }

    public var height: Dimension {
        get {
            let anchor = self.heightAnchor as! Dimension
            anchor.type = AnchorType.Height
            return anchor
        }
    }
    
    public var width: Dimension {
        get {
            let anchor = self.widthAnchor as! Dimension
            anchor.type = AnchorType.Width
            return anchor
        }
    }
}


