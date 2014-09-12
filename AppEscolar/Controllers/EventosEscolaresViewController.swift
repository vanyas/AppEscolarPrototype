//
//  EventosEscolaresViewController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 10/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class EventosEscolaresViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    //MARK: -
    //MARK: Outlet's
    
    @IBOutlet weak var eventosTableView: UITableView!
    
    var masterNavigationController:MasterNavigationController{
        get{
            
            return self.navigationController as MasterNavigationController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = masterNavigationController.showMenuButton
        
        //configure tableView
        eventosTableView.estimatedRowHeight = 56
        eventosTableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: -
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(EventoEscolarCell.identifierID(), forIndexPath: indexPath) as EventoEscolarCell
        
        cell.eventTextLabel.text = "A really long text lets hope it expands" + " [\(indexPath.row)]"
        
        return cell
    }
    
    //MARK: -
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        
    }
    
    
    //MARK: -
    //MARK: Child View Controller
    override func didMoveToParentViewController(parent: UIViewController?) {
        
        //TODO: find best wait ti update layout
        var visibleCells:[NSIndexPath] = self.eventosTableView.indexPathsForVisibleRows() as [NSIndexPath]
        self.eventosTableView.reloadRowsAtIndexPaths(visibleCells, withRowAnimation: UITableViewRowAnimation.None)
    }

}
