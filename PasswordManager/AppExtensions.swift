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
}
