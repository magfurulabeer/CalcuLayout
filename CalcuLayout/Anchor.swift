//
//  Anchor.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

public class Anchor {
    
    public var view: UIView
    public var attribute: NSLayoutAttribute = NSLayoutAttribute.NotAnAttribute
    private var actualAnchor: NSLayoutAnchor
    
    public var anchor: NSLayoutAnchor {
        get {
            return self.actualAnchor
        }
        set {
            self.actualAnchor = newValue
        }
    }
    
    
    
 
    
    public init(view: UIView, anchor: NSLayoutAnchor, attribute: NSLayoutAttribute) {
        self.actualAnchor = anchor
        self.attribute = attribute
        self.view = view
    }
    
   /* private func layoutClassForAttribute(layoutAttribute: NSLayoutAttribute) {
        switch layoutAttribute {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        case .Left:
            <#statement#>
        case .Right:
            <#statement#>
        case .Top:
            <#statement#>
        case .Bottom:
            <#statement#>
        case .Leading:
            <#statement#>
        case .Trailing:
            <#statement#>
        case .Width:
            <#statement#>
        case .Height:
            <#statement#>
        case .CenterX:
            <#statement#>
        case .CenterY:
            <#statement#>
        case .Baseline:
            <#statement#>
        case .LastBaseline:
            <#statement#>
        case .FirstBaseline:
            <#statement#>
        case .LeftMargin:
            <#statement#>
        case .RightMargin:
            <#statement#>
        case .TopMargin: 
            <#statement#>
        case .BottomMargin: 
            <#statement#>
        case .LeadingMargin: 
            <#statement#>
        case .TrailingMargin: 
            <#statement#>
        case .CenterXWithinMargins: 
            <#statement#>
        case .CenterYWithinMargins: 
            <#statement#>
        case .NotAnAttribute: 
            <#statement#>
        }
    }*/
    
}

public class Constraint: NSLayoutConstraint {
    
}

//public class Dimension: Anchor {
//    public override var anchor: NSLayoutDimension?
//    
//    public init(dimension: NSLayoutDimension, type: NSLayoutAttribute) {
//        super.init()
//        self.anchor = dimension
//        self.type = type
//    }
//}
//
//public class XAnchor: Anchor {
//    public var anchor: NSLayoutXAxisAnchor?
//    
//    public init(axis: NSLayoutXAxisAnchor, type: NSLayoutAttribute) {
//        super.init()
//        self.anchor = axis
//        self.type = type
//    }
//}
//
//public class YAnchor: Anchor {
//    public var anchor: NSLayoutYAxisAnchor?
//    
//    public init(axis: NSLayoutYAxisAnchor, type: NSLayoutAttribute) {
//        super.init()
//        self.anchor = axis
//        self.type = type
//    }
//}


