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
        self.zz_presentSheetController(["相册","xxxxxx","屏蔽用户","举报它","分享用户"], clickItemHandler: { [weak self] (index) in
            guard let strongSelf = self else { return }
                if index == 0{
                    strongSelf.zz_presentPhotoVC(4, completeHandler: { (assets) in
                        print(assets.count)
                    })
                }
                print(index)
            })
        
    }
}

















