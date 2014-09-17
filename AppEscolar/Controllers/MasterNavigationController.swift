//
//  MasterNavigationController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 10/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit
import QuartzCore

class MasterNavigationController: UINavigationController {
    
    var sidebarController:SidebarMenuController{
        get{
            return self.parentViewController as SidebarMenuController
        }
    }
    
    var showMenuButton : UIBarButtonItem?
    
    var showNotificationsButton : UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showMenuButton = UIBarButtonItem(title: "Menú",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showSideBarMenu"))
        
        showNotificationsButton = UIBarButtonItem(title: "Avisos",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showNotifications"))
        
        
        showNotificationsButton?.tintColor = UIColor.redColor()

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showSideBarMenu(){
        self.sidebarController.zoomOutPresentedController(animated: true)
    }
    
    func showNotifications(){
        self.sidebarController.ShowNotificationsController()
    }

}
