//
//  SecondCell.swift
//  TransitionDemo
//
//  Created by duzhe on 16/3/15.
//  Copyright © 2016年 dz. All rights reserved.
//

import UIKit

private let sw:CGFloat = UIScreen.mainScreen().bounds.width
private let sh:CGFloat = UIScreen.mainScreen().bounds.height
class PresentCell: UITableViewCell {
    
    private var nameLabel:UILabel!
    
    var name:String = ""{
        didSet{
            self.nameLabel.text = name
        }
    }
    
    var isCancel:Bool = false{
        didSet{
            if isCancel{
                nameLabel.textColor = UIColor(red: 0xDD/255, green: 47/255, blue: 47/255, alpha: 1)
            }else{
                nameLabel.textColor = UIColor.darkGrayColor()
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        nameLabel = UILabel()
        nameLabel.textAlignment = .Center
        self.contentView.addSubview(nameLabel)
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.font = UIFont.systemFontOfSize(16)
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1, constant: 0))
        self.contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

