//
//  CustomSlidingController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 08/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit



class CustomSlidingController: UIViewController,UIBarPositioningDelegate {
    
    /* BEGIN - INTERFACE BUILDER OUTLETS */
    

    
    /* END - INTERFACE BUILDER OUTLETS */
    
    //MARK: - Properties
    /* BEGIN - PROPERTIES */
    var leftSideBarMenuController:SidebarMenuController?
    var isLefMenuOpen = false
    
    let transitionDelegateObject = SlideTransitionDelegate()

    
    /* END - PROPERTIES */
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        //instatiate Left menu & configure transition
        self.leftSideBarMenuController = storyboard?.instantiateViewControllerWithIdentifier("SidebarMenuController") as? SidebarMenuController
        
        leftSideBarMenuController!.modalPresentationStyle = .Custom
        leftSideBarMenuController!.transitioningDelegate = self.transitionDelegateObject


    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return self.isLefMenuOpen ? UIStatusBarStyle.LightContent : UIStatusBarStyle.Default
    }
    
    
    /*
        Posicionar barra
    */
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached;
    }
    
    
    //MARK: IBAction's
    @IBAction func showMenuButtonTapped(sender: AnyObject) {
        
        presentViewController(self.leftSideBarMenuController!,
            animated: true,
            completion:nil);
        
        
        

    }
}
