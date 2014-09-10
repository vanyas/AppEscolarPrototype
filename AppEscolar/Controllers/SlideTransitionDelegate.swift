//
//  SlideTransitionDelegate.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 08/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class SlideTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {


    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        
        return SlidePresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    
    //present
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideViewControllerAnimator(state: .Show)
    }
    
    //dismiss
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideViewControllerAnimator(state: .Hide)
    }
    
}
