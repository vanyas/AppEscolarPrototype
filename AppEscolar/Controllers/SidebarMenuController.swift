//
//  SidebarMenuController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 08/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit


enum OpcionMenu: String{
    case None = ""
    case EventosEscolares = "EventosEscolaresViewController"
    case CalendarioEscolar = "CalendarioEscolarViewController"
    case DirectorioEscolar = "DirectorioEscolarViewController"
    
}

enum ZoomTransitionType{
    
    case ZoomIn
    case ZoomOut(CGSize)
    
    func transFormForZoom()->CGAffineTransform{
        
        switch self{
        case .ZoomIn: //restore
            return CGAffineTransformIdentity
        case .ZoomOut(let contentSize):
            var scaleAndTranslateTr = CGAffineTransformMakeScale(0.5, 0.5)
            scaleAndTranslateTr = CGAffineTransformTranslate(scaleAndTranslateTr, contentSize.width * 0.75, 0)
            return scaleAndTranslateTr
        }
    }
}



class SidebarMenuController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let opcionesEscuela = [OpcionMenu.EventosEscolares ,
        OpcionMenu.CalendarioEscolar,
        OpcionMenu.DirectorioEscolar]
    
    
    
    /// references the actual "child presented controller"
    var masterNavigationController:MasterNavigationController!
    
    var isZoomingOut:Bool = false
    
    
    //notificationController
    var notificationController:NotificacionesViewController!
    
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet weak var menuTableView: UITableView!
    
    //MARK: -
    //MARK: View lifeCycle
    
    override func viewDidLoad() {
        //customize tableview
        self.menuTableView.rowHeight = 64.0
        self.menuTableView.registerClass(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: MenuTableHeaderView.identifierID())
        
        //notifications
        self.notificationController = self.storyboard?.instantiateViewControllerWithIdentifier("NotificacionesViewController") as NotificacionesViewController
        
        //add navigationController
        
        let eventosVC = storyboard?.instantiateViewControllerWithIdentifier(OpcionMenu.EventosEscolares.toRaw()) as EventosEscolaresViewController
        self.masterNavigationController = MasterNavigationController(rootViewController: eventosVC)
        self.masterNavigationController.view.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        
        self.addChildViewController(masterNavigationController)
        self.view .addSubview(masterNavigationController.view)
        masterNavigationController.didMoveToParentViewController(self)
        
        
        
        self.menuTableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0),
            animated: false,
            scrollPosition: UITableViewScrollPosition.None)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.isZoomingOut ? UIStatusBarStyle.LightContent : UIStatusBarStyle.Default
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
        
        var opcionSeleccionada = opcionesEscuela[indexPath.row]
        
        cell.optionText = self.getAssociatedValueFromOpcionMenu(opcionSeleccionada)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        var headerView =
        tableView.dequeueReusableHeaderFooterViewWithIdentifier(MenuTableHeaderView.identifierID()) as MenuTableHeaderView
        
        headerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        return headerView
    }
    
    
    //MARK: -
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //get option
        var opcionSeleccionada = opcionesEscuela[indexPath.row]
        
        //present new option
        self.willPresentChildViewControllerFromOption(opcionSeleccionada,animated:true)
    }
    
    //MARK: -
    //MARK: Helper Methods
    func getAssociatedValueFromOpcionMenu(opcion:OpcionMenu)->String{
        var optionValue = ""
        
        switch opcion{
        case .None:
            optionValue = ""
        case .EventosEscolares:
            optionValue = "Eventos Escolares"
        case .CalendarioEscolar:
            optionValue = "Calendario Escolar"
        case .DirectorioEscolar:
            optionValue = "Directorio Escolar"
        }
        
        return optionValue
    }
    
    
    //MARK: -
    //MARK: Transition to next Controller
    func willPresentChildViewControllerFromOption(option:OpcionMenu, animated:Bool){

        //create instance of view controller
        var nextPresentedController =  self.storyboard?.instantiateViewControllerWithIdentifier(option.toRaw()) as UIViewController
        
        
        if animated == false { //just replace an zoom in
            
            //add next ViewController's view to parent navigationController
            masterNavigationController.setViewControllers([nextPresentedController], animated: false)
            //zoomIn
            self.zoomInPresentedController(animated: false)
            return
        }else{ //animated!
            
            //take screenshot of current navigationController's view
            var snapShotView = self.masterNavigationController.view.snapshotViewAfterScreenUpdates(false)
            
            //add next ViewController's view to parent navigationController
            masterNavigationController.setViewControllers([nextPresentedController], animated: false)
            
            //add snapshot to superview (it needs to have the same ZoomOut transform than current child controller)
            snapShotView.transform = ZoomTransitionType.ZoomOut(self.view.bounds.size).transFormForZoom()
            self.view.insertSubview(snapShotView, belowSubview: self.menuTableView) //below menu
            
            //slide animation
            var animationController = slideInOutAnimationController()
            animationController.slideOutandIdAnimationForViews(slideOutView: snapShotView,
                slideInView: masterNavigationController.view) { () -> () in
                    snapShotView.removeFromSuperview()
                    self.zoomInPresentedController(animated: true)
                    
                    
            }
            
        }//end else
        

    }
    
    
    //MARK: -
    //MARK: Transitions
    func zoomOutPresentedController(#animated:Bool){
        
        let contentSize = self.view.bounds.size
        let transition = ZoomTransitionType.ZoomOut(contentSize)
        
        //disable interaction
        self.isZoomingOut = true
        
        //do transform animation
        self.applyTransForm(transition.transFormForZoom(), toView: self.masterNavigationController.view, animated:animated)
    
    }
    
    func zoomInPresentedController(#animated:Bool){
    
        //re-enable interaction
        self.isZoomingOut = false
        
        //do transform animation
        self.applyTransForm(ZoomTransitionType.ZoomIn.transFormForZoom(), toView: self.masterNavigationController.view, animated: animated)
    }
    
    func applyTransForm(transformToApply:CGAffineTransform, toView:UIView, animated:Bool){

        var duration = animated ? 0.3 : 0.0
        
        UIView.animateWithDuration(duration,
            delay: 0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 10,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                //update status bar style
                self.setNeedsStatusBarAppearanceUpdate()
                toView.transform = transformToApply
            },
            completion: { _ in
                self.masterNavigationController.view.userInteractionEnabled = !self.isZoomingOut
        })
    }
    
    
    //MARK: -
    //MARK: Touches
    
    //detect touch on zoomView
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var touch: UITouch! = touches.anyObject() as UITouch
        
        var touchPoint = touch.locationInView(self.view)
        
        if CGRectContainsPoint(masterNavigationController.view.frame, touchPoint){
            
            //zoom in
            self.zoomInPresentedController(animated: true)
            
        }//end if
        
    }
    
    //MARK: -
    //MARK: Notications
    
    func ShowNotificationsController(){

        self.masterNavigationController.showViewController(notificationController,
            sender: masterNavigationController)
        
    }
}






























