//
//  slideOutAnimationDelegate.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 11/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class slideInOutAnimationController: NSObject {
   
    
    //MARK: -
    //MARK: properties
    private var completionBlk:((Void)->(Void))?
    private weak var viewToSlideIn:UIView?
    
    var duration = 0.4
    
    //MARK: -
    //MARK: Util
    private func toRadians(#degrees:CGFloat)->CGFloat{
        
        return  degrees * CGFloat(M_PI/180.0)
    }
    
    
    
    //MARK: -
    //MARK: internal methods Methods
    func slideOutandIdAnimationForViews(#slideOutView:UIView, slideInView:UIView, completion completionBlock:((Void)->(Void))?){
    
        
        //saveBlock
        self.completionBlk = completionBlock
        
        //save slideInView
        self.viewToSlideIn = slideInView
        
        //execute slide out animation which will call the slide in animation on delegate
        //self.slideOutAnimationsForView(slideOutView)
        self.slideInAnimationsForView(slideInView)
    }
    
    
    //MARK: -
    //MARK: Animation Delegate
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        var animationName:String? = anim.valueForKey("animationName") as String?
        
        if  animationName  == "slideInAnimation" {
            //execute completion block
            if let somethingToDo = completionBlk{
                somethingToDo()
            }//end if
            
        }//end if

    }
    
    override func animationDidStart(anim: CAAnimation!) {
        var animationName:String? = anim.valueForKey("animationName") as String?
        
        if  animationName  == "slideOutAnimation" {
            //begin slide in animation
            if let slideInView = self.viewToSlideIn{
                self.slideInAnimationsForView(slideInView)

            }
        }//end if
        

    }
    
    //MARK: -
    //MARK: layer Animations
    private func slideOutAnimationsForView(slideOutView:UIView){

        //slideOutView rotates and translates left to right, top to bottom
        
        var rotateOutAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotateOutAnimation.duration = duration
        rotateOutAnimation.toValue = toRadians(degrees: -90)

        //final position
        var slideOutFinalPosition = CGPointMake( CGRectGetMaxX(slideOutView.frame) + slideOutView.bounds.width/2,
            CGRectGetMaxY(slideOutView.frame) + slideOutView.bounds.height/4)
        
        var positionOutAnimation = CABasicAnimation(keyPath:"position")
        positionOutAnimation.duration = duration
        positionOutAnimation.toValue =  NSValue(CGPoint: slideOutFinalPosition)
        
        //alfa
    
        var fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.duration = duration
        fadeOutAnimation.fromValue = 1.0
        fadeOutAnimation.toValue = 0.0
    
        //update layer
        slideOutView.layer.opacity = 0.0
        
        //animationGroup
        var animationGroup = CAAnimationGroup()
        animationGroup.duration = duration
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animationGroup.delegate = self //Important: Core Animation retains the delegate
        animationGroup.animations = [rotateOutAnimation, positionOutAnimation,fadeOutAnimation]
        animationGroup.setValue("slideOutAnimation", forKey: "animationName")
        
        slideOutView.layer.addAnimation(animationGroup, forKey: "slideOut")
        
    
    }
    
    
    private func slideInAnimationsForView(slideInView:UIView){
       
        
        //final position == original position
        var slideInFinalPosition = slideInView.layer.position
        
        //slideInView enters from right
        var slideInStartPosition = CGPointMake(slideInView.layer.position.x + slideInView.bounds.width, slideInView.layer.position.y)
        
        
        var positionInAnimation = CABasicAnimation(keyPath:"position")
        positionInAnimation.duration = duration
        positionInAnimation.fromValue = NSValue(CGPoint: slideInStartPosition)
        positionInAnimation.toValue =  NSValue(CGPoint: slideInFinalPosition)
        positionInAnimation.setValue("slideInAnimation", forKey: "animationName")
        positionInAnimation.delegate = self
        positionInAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        slideInView.layer.addAnimation(positionInAnimation, forKey: "slideIn")
    }
}








