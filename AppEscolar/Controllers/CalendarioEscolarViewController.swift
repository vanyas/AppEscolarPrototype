//
//  CalendarioEscolarViewController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 10/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class CalendarioEscolarViewController: UIViewController {
    
    //MARK: -
    //MARK: OUtlet's
    
    @IBOutlet weak var contentView: UIView!
    
    //MARK: -
    //MARK: properties
    var calendarView:MNCalendarView!

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
        
        
        //add CalendarView
        
        calendarView = MNCalendarView(frame: contentView.bounds)
        calendarView.calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        calendarView.selectedDate = NSDate()
        calendarView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        calendarView.backgroundColor = UIColor.whiteColor()
        calendarView.separatorColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        contentView.addSubview(calendarView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.calendarView.setNeedsLayout()
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
