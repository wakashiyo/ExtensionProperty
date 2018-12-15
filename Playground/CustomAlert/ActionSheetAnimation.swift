//
//  ActionSheetAnimation.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit

class ActionSheetAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    //true dismiss
    //false present
    var isPresent: Bool
    
    let duration: Double = 0.3
    
    let height: CGFloat = 200
    
    init(_ isPresent: Bool) {
        self.isPresent = isPresent
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            dismissAnimation(transitionContext)
        } else {
            presentAnimation(transitionContext)
        }
    }
    
    func presentAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        let actionSheet = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ActionSheetController
        let container = transitionContext.containerView
        
        actionSheet.baseView.alpha = 0
        
        container.addSubview(actionSheet.view)
        
        UIView.animate(withDuration: duration,
                       animations: {
                        actionSheet.baseView.alpha = 0.7
                        actionSheet.ActionSheet.transform = CGAffineTransform(translationX: 0, y: -self.height)
        },
                       completion: { bool in
                        transitionContext.completeTransition(true)
        })
    }
    
    func dismissAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let actionSheet = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ActionSheetController
        
        UIView.animate(withDuration: duration,
                       animations: {
                        actionSheet.baseView.alpha = 0
                        actionSheet.ActionSheet.transform = CGAffineTransform(translationX: 0, y: self.height)
        },
                       completion: { bool in
                        transitionContext.completeTransition(true)
        })
    }
    
}
