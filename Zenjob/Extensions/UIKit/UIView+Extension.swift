//
//  UIView+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension UIView {

  func castShadow(radius: CGFloat, opacity: Float, offsetWidth: Int, offsetHeight: Int) {
    self.layer.shadowColor = UIColor.darkG.cgColor
    self.layer.shadowRadius = radius
    self.layer.shadowOpacity = opacity
    self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
    self.layer.masksToBounds = false
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
  }

  func applyGradient(startColor: CGColor, endColor: CGColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.bounds
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.colors = [startColor, endColor]
    self.layer.insertSublayer(gradientLayer, at: 0)
  }

}
