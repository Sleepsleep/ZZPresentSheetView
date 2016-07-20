//
//  ViewController.swift
//  TransitionDemo
//
//  Created by duzhe on 16/3/14.
//  Copyright © 2016年 dz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func zc1(sender: AnyObject) {
        self.zz_presentSheetController(["相册","举报他","分享用户"],clickItemHandler: {(index) in
                print(index)
            })
        
    }
}

















