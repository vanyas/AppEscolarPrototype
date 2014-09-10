//
//  SlidePresentationController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 08/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class SlidePresentationController: UIPresentationController {

    
    override func presentationTransitionWillBegin() {
        self.animateStatusbarStyle(toLigthStyle: true)
    }
    
    
    override func dismissalTransitionWillBegin() {
        self.animateStatusbarStyle(toLigthStyle: false)
    }
    
    
    /* Animate status bar style */
    
    func animateStatusbarStyle(toLigthStyle menuWillOpen:Bool){
        
        if let presentedCoordinator = self.presentedViewController.transitionCoordinator(){
            //the controller key of the slidingController
            var controllerKey = menuWillOpen ?  UITransitionContextFromViewControllerKey : UITransitionContextToViewControllerKey
            
            if let slidingController =
                presentedCoordinator.viewControllerForKey(controllerKey) as? CustomSlidingController {
                
                presentedCoordinator.animateAlongsideTransition({ context in
                    //change status bar style
                    slidingController.isLefMenuOpen = menuWillOpen
                    slidingController.setNeedsStatusBarAppearanceUpdate()
                    
                    }, completion:{ context in
                        
                })//end animate
            }//end if
            
        }
    }
}
