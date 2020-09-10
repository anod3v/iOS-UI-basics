//
//  LoadScreenView.swift
//  LoginForm
//
//  Created by Andrey on 04/09/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import UIKit

class LoadScreenView: UIView {
    
    @IBOutlet weak var spinnerView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    
    
    let lay = CAReplicatorLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("LoadScreenView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)

    }
    
    override func didMoveToSuperview() {
        setUpLayer()
        spinnerView.layer.addSublayer(lay)
        
        var secondsCount = 0
        
//        let timer = Timer.init(timeInterval: 1, repeats: true) { (timer) in
//            self.superview?.superview?.isUserInteractionEnabled = false
//            secondsCount += 1
//            if secondsCount == 20 {
//                timer.invalidate()
//                hideView()
//                self.superview?.superview?.isUserInteractionEnabled = true
//            }
//        }
//        
//        RunLoop.main.add(timer, forMode: RunLoop.Mode.default)
        
        func hideView() {
            
            self.isHidden = true
            
        }
        
    }
    
    
    
    func setUpLayer() {
        
        let superBounds = spinnerView.bounds
        
        let numberOfDots = 5
        
        let spacing: CGFloat = 5
        
        lay.frame = superBounds
        let circleLayer = CAShapeLayer();
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: spacing, y: 0, width: (superBounds.width / CGFloat(numberOfDots)) - spacing, height: superBounds.height)).cgPath;
        circleLayer.fillColor = UIColor.systemBlue.cgColor
        lay.addSublayer(circleLayer)
        //    let bar = CALayer()
        //    bar.frame = CGRect(x: 0,y: 0,width: superBounds.width / CGFloat(numberOfDots) ,height: superBounds.height)
        //    bar.backgroundColor = UIColor.systemBlue.cgColor
        //    layer.addSublayer(bar)
        lay.instanceCount = numberOfDots
        lay.instanceTransform = CATransform3DMakeTranslation(superBounds.width / CGFloat(numberOfDots), 0, 0)
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1.0
        animation.toValue = 0.2
        animation.duration = 1
        animation.repeatCount = .infinity
        circleLayer.add(animation, forKey: nil)
        lay.instanceDelay = animation.duration / Double(lay.instanceCount)
    }
}

