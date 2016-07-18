//
//  SecondViewController.swift
//  TransitionDemo
//
//  Created by duzhe on 16/3/14.
//  Copyright © 2016年 dz. All rights reserved.
//

import UIKit

private let kRowHeight:CGFloat = 40
private let cellIdetiter = "secondCell"
class ZZPresentVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    private var items:[String] = []
    
    private var clickItems:((item:Int)->())?
    init(items:[String]){
        self.items = items
        self.items.append("取消")
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, CGFloat(items.count)*kRowHeight)
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left:20, bottom: 0, right: 20)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.scrollEnabled = false
        tableView.rowHeight = kRowHeight
        tableView.registerClass(PresentCell.self, forCellReuseIdentifier: cellIdetiter)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func clickItemHandle(clickItems:((itemIndex:Int)->())?){
        self.clickItems = clickItems
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdetiter, forIndexPath: indexPath) as! PresentCell
        cell.name = items[indexPath.row]
        if indexPath.row == items.count-1{
            cell.isCancel = true
        }else{
            cell.isCancel = false
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.dismissViewControllerAnimated(true){ [weak self] in
            self?.clickItems?(item: indexPath.row)
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


