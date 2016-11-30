//
//  UIView+CalcuLayout.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

/// This extension adds Anchor alternatives of NSLayoutAnchors to UIView. They're actually NSLayoutAttributes underneath.
public extension UIView {
    
    /// Left NSLayoutAttribute
    public var left: Anchor {
        return Anchor(view: self, attribute: .left)
    }
    
    /// Right NSLayoutAttribute
    public var right: Anchor {
        return Anchor(view: self, attribute: .right)
    }
    
    /// Top NSLayoutAttribute
    public var top: Anchor {
        return Anchor(view: self, attribute: .top)
    }
    
    /// Bottom NSLayoutAttribute
    public var bottom: Anchor {
        return Anchor(view: self, attribute: .bottom)
    }
    
    /// Leading NSLayoutAttribute
    public var leading: Anchor {
        return Anchor(view: self, attribute: .leading)
    }
    
    /// Trailing NSLayoutAttribute
    public var trailing: Anchor {
        return Anchor(view: self, attribute: .trailing)
    }
    
    /// Width NSLayoutAttribute
    public var width: Anchor {
        return Anchor(view: self, attribute: .width)
    }
    
    /// Height NSLayoutAttribute
    public var height: Anchor {
        return Anchor(view: self, attribute: .height)
    }
    
    /// CenterX NSLayoutAttribute
    public var centerX: Anchor {
        return Anchor(view: self, attribute: .centerX)
    }
    
    /// CenterY NSLayoutAttribute
    public var centerY: Anchor {
        return Anchor(view: self, attribute: .centerY)
    }
    
    /// Baseline NSLayoutAttribute
    public var baseline: Anchor {
        return Anchor(view: self, attribute: .lastBaseline)
    }
    
    /// Last Baseline NSLayoutAttribute
    public var lastBaseline: Anchor {
        return Anchor(view: self, attribute: .lastBaseline)
    }
    
    /// First Baseline NSLayoutAttribute
    public var firstBaseline: Anchor {
        return Anchor(view: self, attribute: .firstBaseline)
    }
    
    /// Left Margin NSLayoutAttribute
    public var leftMargin: Anchor {
        return Anchor(view: self, attribute: .leftMargin)
    }
    
    /// Right Margin NSLayoutAttribute
    public var rightMargin: Anchor {
        return Anchor(view: self, attribute: .rightMargin)
    }
    
    /// Top margin NSLayoutAttribute
    public var topMargin: Anchor {
        return Anchor(view: self, attribute: .topMargin)
    }
    
    /// Bottom Margin NSLayoutAttribute
    public var bottomMargin: Anchor {
        return Anchor(view: self, attribute: .bottomMargin)
    }
    
    /// Leading Margin NSLayoutAttribute
    public var leadingMargin: Anchor {
        return Anchor(view: self, attribute: .leadingMargin)
    }
    
    /// Trailing Margin NSLayoutAttribute
    public var trailingMargin: Anchor {
        return Anchor(view: self, attribute: .trailingMargin)
    }
    
    /// CenterX Within Margins NSLayoutAttribute
    public var CenterXWithinMargins: Anchor {
        return Anchor(view: self, attribute: .centerXWithinMargins)
    }
    
    /// CenterY Within Margins NSLayoutAttribute
    public var CenterYWithinMargins: Anchor {
        return Anchor(view: self, attribute: .centerYWithinMargins)
    }
}


