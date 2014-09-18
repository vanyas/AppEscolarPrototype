//
//  HorarioClasesViewController.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 18/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class HorarioClasesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var horarioTableView: UITableView!
    
    private var materias:[String]!
    
    private let startTimes = ["8:00 am",
        "9:00 am", "10:00 am", "11:30 am", "12:00 pm", "1:00 pm"]
    
    private let endTimes = ["9:00 am",
        "10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        materias = ["Matemáticas", "Español","Ciencias Naturales",
        "Receso","Historia","Deportes"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materias.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(EventoEscolarCell.identifierID()) as EventoEscolarCell
        cell.eventTextLabel.text = materias[indexPath.row]
        
        
        cell.startTimeLabel.font = cell.startTimeLabel.font.fontWithSize(10)
        cell.endTimeLabel.font = cell.endTimeLabel.font.fontWithSize(10)
        
        cell.startTimeLabel.text = startTimes[indexPath.row]
        cell.endTimeLabel.text = endTimes[indexPath.row]
        
        return cell
    }

}
