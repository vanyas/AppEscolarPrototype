//
//  MasterNavigationController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 10/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class MasterNavigationController: UINavigationController {
    
    var sidebarController:SidebarMenuController{
        get{
            return self.parentViewController as SidebarMenuController
        }
    }
    
    var showMenuButton : UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showMenuButton = UIBarButtonItem(title: "Menú",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showSideBarMenu"))

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showSideBarMenu(){
        self.sidebarController.zoomOutPresentedController(animated: true)
    }

}
