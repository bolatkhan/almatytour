//
//  EdgeBorderButton.swift
//  AppleCityGuide
//
//  Created by user on 04.07.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import Foundation

import UIKit

final class EdgeBorderButton: UIButton {
    
    let lineColor: UIColor = UIColor.blackColor()
    let lineWidth: CGFloat = 1
    
    lazy var topLineLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = self.lineWidth
        layer.strokeColor = self.lineColor.CGColor
        return layer
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        backgroundColor = UIColor.whiteColor()
        
        layer.addSublayer(topLineLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let topPath = UIBezierPath()
        topPath.moveToPoint(CGPoint(x: 0, y: 0.5))
        topPath.addLineToPoint(CGPoint(x: CGRectGetWidth(bounds), y: 0.5))
        
        topLineLayer.path = topPath.CGPath
    }
}