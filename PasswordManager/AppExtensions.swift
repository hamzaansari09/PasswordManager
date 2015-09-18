//
//  AppExtensions.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 08/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit

extension UIView {
  
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  func setRoundedCorners(corners:UIRectCorner, radius:CGFloat) {
    let rect = self.bounds;
    
    // Create the path
    let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    
    // Create the shape layer and set its path
    let maskLayer = CAShapeLayer(layer: layer)
    maskLayer.frame = rect
  }
}