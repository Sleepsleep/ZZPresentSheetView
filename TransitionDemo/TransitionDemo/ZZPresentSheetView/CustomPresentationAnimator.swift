//
//  CustomPresentationAnimator.swift
//  CustomTransition-Swift
//
//  Created by 张星宇 on 16/2/10.
//  Copyright © 2016年 zxy. All rights reserved.

import UIKit

class CustomPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        if let isAnimated = transitionContext?.isAnimated() {
            return isAnimated ? 0.6 : 0
        }
        return 0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let isPresenting = (toViewController?.presentingViewController == fromViewController)
        
        var fromViewFinalFrame = transitionContext.finalFrameForViewController(fromViewController!)
        var toViewInitialFrame = transitionContext.initialFrameForViewController(toViewController!)
        let toViewFinalFrame = transitionContext.finalFrameForViewController(toViewController!)
        
        if toView != nil {
            containerView?.addSubview(toView!)
        }
        
        if isPresenting {
            toViewInitialFrame.origin = CGPointMake(CGRectGetMinX(containerView!.bounds), CGRectGetMaxY(containerView!.bounds))
            toViewInitialFrame.size = toViewFinalFrame.size
            toView?.frame = toViewInitialFrame
        } else {
            fromViewFinalFrame = CGRectOffset(fromView!.frame, 0, CGRectGetHeight(fromView!.frame))
        }
        
        let transitionDuration = self.transitionDuration(transitionContext)
        if isPresenting{
            if let rect = fromViewController?.view.frame{
                fromViewController?.view.center = CGPoint(x: rect.width/2 , y:rect.height)
                fromViewController?.view.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            }
        }
        UIView.animateWithDuration(transitionDuration*0.5, animations: { () -> Void in
                if isPresenting {
                    
                    var trans = CATransform3DIdentity
                    trans.m34 = -1 / 1000
                    trans = CATransform3DRotate(trans, CGFloat(M_PI/18) , 1 , 0 , 0)
                    fromViewController?.view.layer.transform = trans
                    
                }else{
                    
                    var trans = CATransform3DIdentity
                    trans.m34 = -1 / 1000
                    trans = CATransform3DRotate(trans, CGFloat(M_PI/18) , 1 , 0 , 0)
                    toViewController?.view.layer.transform = trans
                    
                }
            
            }) { (b) -> Void in
                UIView.animateWithDuration(transitionDuration*0.5, animations: { () -> Void in
                    if isPresenting {
                        var trans = CATransform3DIdentity
                        trans = CATransform3DScale(trans, 0.85, 0.95, 1)
                        fromViewController?.view.layer.transform = trans
                    }else{
                        toViewController?.view.layer.transform = CATransform3DIdentity
                    }
                })
        }
        
        UIView.animateWithDuration(transitionDuration, animations: {
            if isPresenting {
                toView?.frame = toViewFinalFrame
            }
            else {
                fromView?.frame = fromViewFinalFrame
            }
            }) { (finished: Bool) -> Void in
                let wasCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!wasCancelled)
        }
    }
}
