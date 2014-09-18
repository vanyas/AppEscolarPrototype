//
//  AsistenciasViewController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 18/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class AsistenciasViewController: UIViewController, RSDFDatePickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var slice = CGRectZero;
        var remainder = CGRectZero;
        
        CGRectDivide(view.bounds, &slice, &remainder, 64.0, CGRectEdge.MinYEdge)
        
        let calendar = RSDFDatePickerView(frame: remainder)
        
        calendar.dataSource = self
        
        self.view .addSubview(calendar)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func datePickerView(view: RSDFDatePickerView!, isCompletedAllTasksOnDate date: NSDate!) -> Bool {
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay,
            fromDate: NSDate())
        
        var today = calendar.dateFromComponents(components)
        
        let untilToday = calendar.compareDate(date, toDate: today!, toUnitGranularity: NSCalendarUnit.CalendarUnitDay)
        
  
        
        return untilToday == NSComparisonResult.OrderedAscending
    }
    
    func datePickerView(view: RSDFDatePickerView!, shouldMarkDate date: NSDate!) -> Bool {
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components(NSCalendarUnit.WeekdayCalendarUnit, fromDate: date)
        
        if components.weekday == 7 || components.weekday == 1 {
            return false
        }else{
            return true
        }
        
    }

}
