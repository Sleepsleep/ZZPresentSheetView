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
        nameLabel.textColor = UIColor.darkGrayColor()
        nameLabel.font = UIFont.systemFontOfSize(15)
        nameLabel.frame = CGRectMake(0, 0, sw , self.frame.height)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

