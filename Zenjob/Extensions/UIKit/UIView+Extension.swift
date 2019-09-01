//
//  UIView+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension UIView {


  /**
   Cast a shadow on UIView elements

   - Parameters:
      - radius: The blur radius (in points) used to render the layer’s shadow. Animatable.
      - opacity: The opacity of the layer’s shadow. Animatable.
      - offsetWidth: The offset width (in points) of the layer’s shadow. Animatable.
      - offsetHeight: The offset height (in points) of the layer’s shadow. Animatable.
   */
  func castShadow(radius: CGFloat, opacity: Float, offsetWidth: Int, offsetHeight: Int) {
    self.layer.shadowColor = UIColor.darkG.cgColor
    self.layer.shadowRadius = radius
    self.layer.shadowOpacity = opacity
    self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
    self.layer.masksToBounds = false
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
  }


  /**
   Apply a gradient layer on UIView

   - Parameters:
       - startColor: An array of CGColorRef object defining the color of the starting gradient stop. Animatable.
       - endColor: An array of CGColorRef object defining the color of the ending gradient stop. Animatable.
   */
  func applyGradient(startColor: CGColor, endColor: CGColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.bounds
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.colors = [startColor, endColor]
    self.layer.insertSublayer(gradientLayer, at: 0)
  }

}
