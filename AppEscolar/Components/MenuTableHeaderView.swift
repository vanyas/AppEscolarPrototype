//
//  MenuTableHeaderView.swift
//  AppEscolar
//
//  Created by VANGELI ONTIVEROS on 12/09/14.
//  Copyright (c) 2014 VANGELI ONTIVEROS. All rights reserved.
//

import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {

    
    class func identifierID()->String{
        return "MenuTableHeaderViewID"
    }
    
    //MARK: -
    //MARK: uiComponents
    var sectionTitleLabel:UILabel = UILabel()

    
    //MARK: -
    //MARK: properties
    private var contentGradientLayer:CAGradientLayer!

    
    //MARK: -
    //MARK: Common Setup
    
    private func commonSetup(){
        //add gradient

        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.clearColor()
        self.contentView.backgroundColor = UIColor.clearColor()
        
        //create layer
        contentGradientLayer = getBackGroundLayer()
        contentGradientLayer.opacity = 0.4
        self.contentView.layer.addSublayer(contentGradientLayer)
        
        //title
        self.sectionTitleLabel.text = "Mi Escuela"
        self.sectionTitleLabel.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        self.sectionTitleLabel.backgroundColor = UIColor.clearColor()
        self.sectionTitleLabel.font = sectionTitleLabel.font.fontWithSize(14.0)
        self.contentView.addSubview(sectionTitleLabel)
        
    
        //self.contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.sectionTitleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    //MARK: -
    //MARK: init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonSetup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    
    //MARK: -
    //MARK: layout
    override func layoutSubviews() {
        super.layoutSubviews()
        contentGradientLayer.frame = self.contentView.bounds
       
    }
    
    override class func layerClass() -> AnyClass{
        return CAGradientLayer.self
    }
    
    //MARK: -
    //MARK: Util
    private func getBackGroundLayer()->CAGradientLayer{
        var gradientLayer = CAGradientLayer()
        
        
        var colors:[AnyObject] =
        [UIColor(white: 0.9, alpha: 1.0).CGColor,
            UIColor(white: 0.8, alpha: 1.0).CGColor,
            UIColor.clearColor().CGColor]
        
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 0.1, 1.0,]
        gradientLayer.startPoint = CGPointMake(0, 0.5)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        
        return gradientLayer
    }
    
    
    //MARK: -
    //MARK: Constraints
    override func updateConstraints() {
        
        dispatch_once(&tokenConstraints) { () -> Void in
            self.createCustomConstraints()
        }
         self.createCustomConstraints()
        
        super.updateConstraints()
    }
    
    
    var tokenConstraints: dispatch_once_t = 0 //token
    
    private func createCustomConstraints(){
        
        var views:[NSObject:AnyObject] = ["sectionTitleLabel":sectionTitleLabel]
        
        var visualFormat = "H:|-[sectionTitleLabel]-|"
        
        var horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(visualFormat,
            options: NSLayoutFormatOptions.allZeros,
            metrics: nil,
            views: views)
        
        self.contentView.addConstraints(horizontalConstraints)
        
        //vertical
        self.contentView.addConstraint(NSLayoutConstraint(item: sectionTitleLabel,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.contentView,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0))
    }
}


















































