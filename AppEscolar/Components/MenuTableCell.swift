//
//  MenuTableCell.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 10/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    
    @IBOutlet weak var opcionLabel: UILabel!
    
    var optionText: String{
        get{
            
            if let noEmpty = self.opcionLabel.text{
                return noEmpty
            }
            return ""
        }
        
        set{
            self.opcionLabel.text = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectedBackgroundView = UIView()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        var toAlpha:CGFloat = 0
        if selected{
            selectedBackgroundView.backgroundColor = UIColor.clearColor()
            toAlpha = 1.0
        }else{
            toAlpha = 0.7
        }
        
        var duration  = selected ? 0.4 : 0.0

        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.alpha = toAlpha
        })
    }

}
