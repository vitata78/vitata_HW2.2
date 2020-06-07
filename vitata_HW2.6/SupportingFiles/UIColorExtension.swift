//
//  UIColorExtension.swift
//  vitata_HW2.6
//
//  Created by Svetlana Tolstova on 6/6/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import SpriteKit

public extension UIColor {

    var getRedFloat: Float {
        get {
            var r: CGFloat = 0
            if (self.getRed(&r, green: nil, blue: nil, alpha: nil)) {
                return Float(r)
            } else {
                return 0
            }
        }
    }
    var getGreenFloat: Float {
        get {
            var g: CGFloat = 0
            if (self.getRed(nil, green: &g, blue: nil, alpha: nil)) {
                return Float(g)
            } else {
                return 0
            }
        }
    }
    var getBlueFloat: Float {
        get {
            var b: CGFloat = 0
            if (self.getRed(nil, green: nil, blue: &b, alpha: nil)) {
                return Float(b)
            } else {
                return 0
            }
        }
    }

}
