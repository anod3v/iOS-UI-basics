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
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: source.view.frame.height)
            .rotated(by: .pi * 1.5)
            .translatedBy(x: source.view.frame.width, y: source.view.frame.height)
            //------
        
            //------
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.1,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        let rotation = CGAffineTransform(translationX: -source.view.frame.width, y: -source.view.frame.height)
                                                        .rotated(by: .pi * -1.5)
                                                        .translatedBy(x: source.view.frame.width, y: source.view.frame.height)
                                                        source.view.transform = rotation
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
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
