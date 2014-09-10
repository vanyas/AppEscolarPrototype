//
//  SlideViewControllerAnimator.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 08/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

enum SlideTransition{
    case Show
    case Hide
    
}

class SlideViewControllerAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    
    var slideState : SlideTransition
    
    let totalDuration = 0.3
    
    init(state:SlideTransition){
        self.slideState = state
        super.init()
        
    }
    

    
    //MARK: -
    //MARK: UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return self.totalDuration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var snapshotView : UIView!
        var transformToApply = CGAffineTransformIdentity
        
        if self.slideState == .Show { //zoom out effect
            
            //add presented view and grab snapshot
            snapshotView = self.InsertPresentedViewIntoHierarchy(inContext: transitionContext)
            
            snapshotView.tag = Int.max
            snapshotView.userInteractionEnabled = false
            //create transform scale & rotate
            transformToApply = self.affineTransformForSlideTransition(.Show,
                inSize: transitionContext.containerView().bounds.size)
            
            
        
        }else{ //already in hierarchy zoom in
            //grab snapshotview
            snapshotView = transitionContext.containerView().viewWithTag(Int.max)
        }
    
        //animate transform
        self.animateSnapshotView(snapshotView,
            transform: transformToApply,
            completion: { (_:Bool) -> Void in
                transitionContext.completeTransition(true);
        })
        
        

    }
    
    
    //MARK: -
    //MARK: View hierarchy
    
    /**
    Inserts the presentedView into the containerView of the presentationcontroller. It also
    makes a snapshot of the presenting view
    
    :param: transitionContext the transitionContext
    
    :returns: snapshot of the presentingView for custom animation
    */
    func InsertPresentedViewIntoHierarchy(inContext transitionContext: UIViewControllerContextTransitioning) -> UIView{
        
        //Get the presentingViewController's view
        
        var snapshotView : UIView!
        
        var controllerKey = slideState == .Show ? UITransitionContextFromViewControllerKey : UITransitionContextToViewControllerKey
        
        if let presentingView = transitionContext.viewControllerForKey(controllerKey)?.view{
            //Take a snapshot of the presenting view
            snapshotView = presentingView.snapshotViewAfterScreenUpdates(false)
        }

        
        //Get the presentedViewController's view
        var presentedView: UIView! = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        //add presentedview to context
        presentedView.frame = transitionContext.containerView().bounds
        

        
        transitionContext.containerView().addSubview(presentedView)
        //add snapshot
        transitionContext.containerView().addSubview(snapshotView)
        
        

        // return the snapshot to make the animation
        return snapshotView
    }
    
    //MARK: -
    //MARK: Animation & Transform
    
    /**
    Creates a CGAffineTransform to scale & translate the snapshotView
    
    :param: state       the state of the transition to do
    :param: contentSize the size of the containerView
    
    :returns: CGAffineTransform to apply
    */
    func affineTransformForSlideTransition(state:SlideTransition, inSize contentSize:CGSize)->CGAffineTransform{
        
        var resultTransform : CGAffineTransform
        
        switch state{
            
        case .Show:
            
            var scaleAndTranslate = CGAffineTransformMakeScale(0.5, 0.5)
                
            resultTransform = CGAffineTransformTranslate(scaleAndTranslate, contentSize.width * 0.8, 0)
            
        case .Hide:
            //no transform
            resultTransform = CGAffineTransformIdentity
            
        }//end switch
        
        return resultTransform
    }
    
    /**
    Performs the animationon the snapshotView
    
    :param: snapshotView the view to animate
    :param: transform    the transform to apply (animated)
    :param: completion   block to execuet when the animation finishes
    */
    func animateSnapshotView(snapshotView:UIView,transform:CGAffineTransform,completion:((Bool)->Void)?){
        
        UIView.animateWithDuration(self.totalDuration,
            delay: 0,
            usingSpringWithDamping:0.75,
            initialSpringVelocity:10,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                //apply transform
                snapshotView.transform = transform
                
            }, completion:completion)
        
    }
    
}
