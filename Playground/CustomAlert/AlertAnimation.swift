//
//  AlertAnimation.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit

class AlertAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    //true: dismiss
    //false: present
    let isPresent: Bool
    
    init(_ isPresent: Bool) {
        self.isPresent = isPresent
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            dismissAnimation(transitionContext)
        } else {
            presentAnimation(transitionContext)
        }
    }
    
    func presentAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        let alert = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! AlertController
        
        let container = transitionContext.containerView
        
        alert.baseView.alpha = 0
        alert.AlertView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        //すでにfromのviewControllerはaddSubviewされているので、addSubviewやinsertSubviewの必要はない
        container.addSubview(alert.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        alert.baseView.alpha = 0.7
                        alert.AlertView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1) },
                       completion: { bool in
                        UIView.animate(withDuration: 0.1, animations: {
                            alert.AlertView.transform = CGAffineTransform.identity
                        })
                        transitionContext.completeTransition(true) })
        
    }
    
    func dismissAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let alert = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! AlertController
        
        UIView.animate(withDuration: 0.3, animations: {
            alert.baseView.alpha = 0
            alert.AlertView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
    
    
}
