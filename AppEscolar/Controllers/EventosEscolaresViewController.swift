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
    
    //MARK: -
    //MARK: Ivars
    //datos precargados
    var fechasList = ["Lunes 15","Martes 16","Miercoles 17","Jueves 18","Viernes 19"]
    
    var eventosList = ["Honores a la Bandera","Junta de Padres de Familia",
        "Presentación Semana Cultural","Junta Consejo Técnico"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = masterNavigationController.showMenuButton
        self.navigationItem.rightBarButtonItem = masterNavigationController.showNotificationsButton
        
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
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fechasList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventosList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(EventoEscolarCell.identifierID(), forIndexPath: indexPath) as EventoEscolarCell
        
        cell.eventTextLabel.text = eventosList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UILabel()
        
        header.text = fechasList[section] + ", de Septiembre de 2014"
        header.textColor = UIColor.whiteColor()
        header.backgroundColor = UIColor(red: 0, green: 121/255, blue: 250/255.0, alpha: 1)
        header.textAlignment = NSTextAlignment.Center
        
        return header
    }
    
    //MARK: -
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    
    
    //MARK: -
    //MARK: Child View Controller
    
    var token: dispatch_once_t = 0
    override func didMoveToParentViewController(parent: UIViewController?) {
        
        //TODO: find best wait ti update layout
        
        dispatch_once(&token) {
            var visibleCells:[NSIndexPath] = self.eventosTableView.indexPathsForVisibleRows() as [NSIndexPath]
            self.eventosTableView.reloadRowsAtIndexPaths(visibleCells, withRowAnimation: UITableViewRowAnimation.None)
            self.title = "Eventos Escolares"
        }
    }

}




























