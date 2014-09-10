//
//  SidebarMenuController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 08/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit


class SidebarMenuController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let opcionesEscuela = ["Eventos Escolares","Calendario Escolar","Directorio Escolar"]
    var snapshotRect:CGRect = CGRectZero
    
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet weak var menuTableView: UITableView!
    
    //MARK: -
    //MARK: View lifeCycle
    
    override func viewDidLoad() {
        //customize tableview
        self.menuTableView.estimatedRowHeight = 84.0
        self.menuTableView.rowHeight = 64.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
        //frame of snapshot

        snapshotRect = CGRectMake(0, 0, self.view.bounds.width/2, self.view.bounds.height/2)
        snapshotRect = CGRectOffset(snapshotRect,
            self.view.bounds.width/2 * 0.8 + self.view.bounds.width/4 ,
            self.view.bounds.height/4 )
    }
    
    
    //detect touch on snapshot rect
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var touch: UITouch! = touches.anyObject() as UITouch
        
        var touchPoint = touch.locationInView(self.view)
        
        if CGRectContainsPoint(snapshotRect, touchPoint){
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
    }
    
    //MARK: -
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var totalRows:Int = 0
        
        switch section{
        case 0:
            totalRows = opcionesEscuela.count
        default:
            totalRows = 0
        }//end switch
        
        return totalRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "menuCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as MenuTableCell
        cell.optionText = opcionesEscuela[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var titleLabel = UILabel()
        
        titleLabel.textColor = UIColor(white: 1.0, alpha: 0.6)
        titleLabel.text = "  Mi escuela"
        
        
        return titleLabel
    }
    
    
}
