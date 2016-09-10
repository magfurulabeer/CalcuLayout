//
//  UIView+CalcuLayout.swift
//  CalcuLayout
//
//  Created by Magfurul Abeer on 9/9/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var left: Anchor {
        return Anchor(view: self, attribute: .Left)
    }
    
    public var right: Anchor {
        return Anchor(view: self, attribute: .Right)
    }
    
    public var top: Anchor {
        return Anchor(view: self, attribute: .Top)
    }
    
    public var bottom: Anchor {
        return Anchor(view: self, attribute: .Bottom)
    }
    
    public var leading: Anchor {
        return Anchor(view: self, attribute: .Leading)
    }
    
    public var trailing: Anchor {
        return Anchor(view: self, attribute: .Trailing)
    }
    
    public var width: Anchor {
        return Anchor(view: self, attribute: .Width)
    }
    
    public var height: Anchor {
        return Anchor(view: self, attribute: .Height)
    }
    
    public var centerX: Anchor {
        return Anchor(view: self, attribute: .CenterX)
    }
    
    public var centerY: Anchor {
        return Anchor(view: self, attribute: .CenterY)
    }
    
    public var baseline: Anchor {
        return Anchor(view: self, attribute: .Baseline)
    }
    
    public var lastBaseline: Anchor {
        return Anchor(view: self, attribute: .LastBaseline)
    }
    
    public var firstBaseline: Anchor {
        return Anchor(view: self, attribute: .FirstBaseline)
    }
    
    public var leftMargin: Anchor {
        return Anchor(view: self, attribute: .LeftMargin)
    }
    
    public var rightMargin: Anchor {
        return Anchor(view: self, attribute: .RightMargin)
    }
    
    public var topMargin: Anchor {
        return Anchor(view: self, attribute: .TopMargin)
    }
    
    public var bottomMargin: Anchor {
        return Anchor(view: self, attribute: .BottomMargin)
    }
    
    public var leadingMargin: Anchor {
        return Anchor(view: self, attribute: .LeadingMargin)
    }
    
    public var trailingMargin: Anchor {
        return Anchor(view: self, attribute: .TrailingMargin)
    }    
//    public var CenterXWithinMargins: Anchor {
//        return Anchor(view: self, attribute: .CenterXWithinMargins)
//    }
//    
//    public var CenterYWithinMargins: Anchor {
//        return Anchor(view: self, attribute: .CenterYWithinMargins)
//    }
}


