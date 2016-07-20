//
//  SecondViewController.swift
//  TransitionDemo
//
//  Created by duzhe on 16/3/14.
//  Copyright © 2016年 dz. All rights reserved.
//

import UIKit

private let kRowHeight:CGFloat = 52
private let cellIdetiter = "secondCell"
class ZZPresentVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    private var items:[String] = []
    
    private var clickItems:((item:Int)->())?
    init(items:[String]){
        self.items = items
//        self.items.append("取消")
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, CGFloat(items.count+1)*kRowHeight+5)
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.scrollEnabled = false
        tableView.rowHeight = kRowHeight
        tableView.registerClass(PresentCell.self, forCellReuseIdentifier: cellIdetiter)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.clearColor()
        let blurView = ZZBlurView()
        tableView.backgroundView = blurView
    }
    
    func clickItemHandle(clickItems:((itemIndex:Int)->())?){
        self.clickItems = clickItems
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdetiter, forIndexPath: indexPath) as! PresentCell
        if indexPath.section == 0{
            cell.name = items[indexPath.row]
            cell.isCancel = false
            
        }else{
            cell.name = "取消"
            cell.isCancel = true
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            return nil
        }else{
            
            let v = UIView()
            v.backgroundColor = UIColor(white: 0.5, alpha: 0.25)
            return v
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return items.count
        }
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 5
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.dismissViewControllerAnimated(true){ [weak self] in
            guard let strongSelf = self else { return }
            if indexPath.section == 0{
                strongSelf.clickItems?( item: indexPath.row )
            }else{
                strongSelf.clickItems?( item: strongSelf.items.count )
            }
            
        }
    }

}


extension UIViewController{
    
    
    func zz_presentSheetController(items:[String],clickItemHandler:((index:Int)->())?,completion:(() -> ())? = nil){
        // 这个相当于toViewController
        let svc:ZZPresentVC = ZZPresentVC(items: items)
        svc.clickItemHandle { (itemIndx) -> () in
            clickItemHandler?(index: itemIndx)
        }
        // 创建PresentationController
        let customPresentationController:CustomPresentationController = CustomPresentationController(presentedViewController: svc, presentingViewController: self)
        
        svc.transitioningDelegate = customPresentationController
        
        self.presentViewController(svc, animated: true, completion: completion)
        
    }
    
}


