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
        return Anchor(view: self, attribute: .left)
    }
    
    public var right: Anchor {
        return Anchor(view: self, attribute: .right)
    }
    
    public var top: Anchor {
        return Anchor(view: self, attribute: .top)
    }
    
    public var bottom: Anchor {
        return Anchor(view: self, attribute: .bottom)
    }
    
    public var leading: Anchor {
        return Anchor(view: self, attribute: .leading)
    }
    
    public var trailing: Anchor {
        return Anchor(view: self, attribute: .trailing)
    }
    
    public var width: Anchor {
        return Anchor(view: self, attribute: .width)
    }
    
    public var height: Anchor {
        return Anchor(view: self, attribute: .height)
    }
    
    public var centerX: Anchor {
        return Anchor(view: self, attribute: .centerX)
    }
    
    public var centerY: Anchor {
        return Anchor(view: self, attribute: .centerY)
    }
    
    public var baseline: Anchor {
        return Anchor(view: self, attribute: .lastBaseline)
    }
    
    public var lastBaseline: Anchor {
        return Anchor(view: self, attribute: .lastBaseline)
    }
    
    public var firstBaseline: Anchor {
        return Anchor(view: self, attribute: .firstBaseline)
    }
    
    public var leftMargin: Anchor {
        return Anchor(view: self, attribute: .leftMargin)
    }
    
    public var rightMargin: Anchor {
        return Anchor(view: self, attribute: .rightMargin)
    }
    
    public var topMargin: Anchor {
        return Anchor(view: self, attribute: .topMargin)
    }
    
    public var bottomMargin: Anchor {
        return Anchor(view: self, attribute: .bottomMargin)
    }
    
    public var leadingMargin: Anchor {
        return Anchor(view: self, attribute: .leadingMargin)
    }
    
    public var trailingMargin: Anchor {
        return Anchor(view: self, attribute: .trailingMargin)
    }
    
    public var CenterXWithinMargins: Anchor {
        return Anchor(view: self, attribute: .centerXWithinMargins)
    }
    
    public var CenterYWithinMargins: Anchor {
        return Anchor(view: self, attribute: .centerYWithinMargins)
    }
}


