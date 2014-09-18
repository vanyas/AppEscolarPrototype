//
//  DetalleHijoViewController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 17/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class DetalleHijoViewController: UIViewController {

    @IBOutlet weak var nombreAlumnoLabel: UILabel!
    
    var masterNavigationController:MasterNavigationController{
        get{
            
            return self.navigationController as MasterNavigationController
        }
    }
    
    var nombreAlumno:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = masterNavigationController.showMenuButton
        self.navigationItem.rightBarButtonItem = masterNavigationController.showNotificationsButton
        
        self.nombreAlumnoLabel.text = nombreAlumno
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
