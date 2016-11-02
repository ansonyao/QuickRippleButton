//
//  RippleButton.swift
//  RippleButton
//
//  Created by Anson Yao on 2016-10-31.
//  Copyright © 2016 TTT. All rights reserved.
//

import UIKit

@IBDesignable
public class QuickRippleButton: UIButton {
    //MARK: - Properties
    @IBInspectable public var duration: Double = 0.5 {
        didSet {
            if duration <= 0 {
                duration = 0.5
            }
        }
    }
    @IBInspectable public var initialAlpha: Double = 0.5 {
        didSet {
            if initialAlpha > 1.0 || initialAlpha < 0 {
                initialAlpha = 0.5
            }
        }
    }
    @IBInspectable public var rippleColor: UIColor = UIColor.white
    
    /// The radius of the ripple is proportional with respect to this value. The ripple will just cover the button when the value is 1.0.
    @IBInspectable public var sizeFactor: CGFloat = CGFloat(1.2) {
        didSet {
            if sizeFactor <= 0 {
                sizeFactor = CGFloat(1.2)
            }
        }
    }
    @IBInspectable public var initalSizeFactor: CGFloat = CGFloat(0.1) {
        didSet {
            if initalSizeFactor <= 0 {
                initalSizeFactor = CGFloat(0.1)
            }
        }
    }
    private var shapeLayer = CAShapeLayer()
    
    //MARK: - Initializers
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        self.addTarget(self, action: #selector(animateRipple), for: UIControlEvents.touchDown)
    }
    
    //MARK: - Animation
    public func animateRipple() {
        if shapeLayer.superlayer != nil {
            shapeLayer.removeFromSuperlayer()
        }
        shapeLayer = CAShapeLayer()
        let center = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
        let diagnolLength = sqrt(bounds.width*bounds.width + bounds.height*bounds.height)
        let path = UIBezierPath(arcCenter: center, radius: 0.5*diagnolLength*initalSizeFactor, startAngle: 0.0, endAngle: (CGFloat(360.0 * M_PI) / 180.0), clockwise: true)
        shapeLayer.path = path.cgPath
        shapeLayer.opacity = Float(initialAlpha)
        shapeLayer.fillColor = rippleColor.cgColor
        shapeLayer.strokeColor = rippleColor.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.frame = bounds
        layer.addSublayer(shapeLayer)
        
        let circleEnlargeAnimation = CABasicAnimation(keyPath: "transform.scale")
        circleEnlargeAnimation.fromValue = 1.0
        circleEnlargeAnimation.toValue = sizeFactor/initalSizeFactor
        circleEnlargeAnimation.duration = duration * 0.7
        circleEnlargeAnimation.fillMode = kCAFillModeForwards
        circleEnlargeAnimation.isRemovedOnCompletion = false
        circleEnlargeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        let fadingOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadingOutAnimation.fromValue = initialAlpha
        fadingOutAnimation.toValue = 0.0
        fadingOutAnimation.duration = duration * 0.8
        fadingOutAnimation.beginTime = duration * 0.2
        fadingOutAnimation.fillMode = kCAFillModeForwards
        fadingOutAnimation.isRemovedOnCompletion = false
        fadingOutAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        let group = CAAnimationGroup()
        group.animations = [circleEnlargeAnimation, fadingOutAnimation]
        group.duration = duration
        
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false
        CATransaction.begin()
        shapeLayer.add(group, forKey: nil)
        CATransaction.commit()
    }
}
