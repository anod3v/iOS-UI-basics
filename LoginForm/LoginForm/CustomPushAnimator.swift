//
//  CustomPushAnimator.swift
//  LoginForm
//
//  Created by Andrey on 09/09/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import UIKit

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        //        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: source.view.frame.height)
            .rotated(by: .pi * 1.5)
            .translatedBy(x: source.view.frame.width, y: source.view.frame.height)
        //        destination.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 3/2)
        //        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
//                                    UIView.addKeyframe(withRelativeStartTime: 0,
//                                                       relativeDuration: 0.75,
//                                                       animations: {
//                                                        //                                                        transitionContext.containerView.layer.anchorPoint = CGPoint(x: 1, y: 0)
//                                                        //                                                           destination.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi*3/2)
//                                                        //                                                        let x =
//                                                        //                                                        let y =
//                                                        //                                                        let degrees = 45.0
//                                                        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
//                                                            .rotated(by: .pi / 3)
//                                                            .translatedBy(x: -source.view.frame.width, y: 0)
//                                    })
                                    
                                    //                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                    //                                                       relativeDuration: 0.75,
                                    //                                                       animations: {
                                    //                                                           let translation = CGAffineTransform(translationX: -200, y: 0)
                                    //                                                           let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                    //                                                           source.view.transform = translation.concatenating(scale)
                                    //                                    })
                                    //                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                    //                                                       relativeDuration: 0.4,
                                    //                                                       animations: {
                                    //                                                           let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                                    //                                                           let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                    //                                                           destination.view.transform = translation.concatenating(scale)
                                    //                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
        
        
    }
    
    
}
