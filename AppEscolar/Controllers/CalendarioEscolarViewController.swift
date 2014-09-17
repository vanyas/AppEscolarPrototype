//
//  CalendarioEscolarViewController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 10/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class CalendarioEscolarViewController: UIViewController {

    var masterNavigationController:MasterNavigationController{
        get{
            
            return self.navigationController as MasterNavigationController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = masterNavigationController.showMenuButton
        self.navigationItem.rightBarButtonItem = masterNavigationController.showNotificationsButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
