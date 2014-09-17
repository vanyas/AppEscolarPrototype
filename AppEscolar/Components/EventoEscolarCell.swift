//
//  EventoEscolarCell.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 12/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class EventoEscolarCell: UITableViewCell {
    
    
    //MARK: -
    //MARK: Outlet's
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var eventTextLabel: UILabel!

    class func identifierID()->String {
        return "EventoEscolarCellID"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
