//
//  YTHomeController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

let resusebleIdentifier = "resusebleIdentifier"

class YTHomeController: YTRootViewController {
    
    var statuses : [YTStatus]? {
        didSet {
             self.tableView.reloadData()
        }
    }
    
    var rowCache : [Int : CGFloat] = [Int : CGFloat].init()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.purple
        topBarType = TopBarType.home
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadUI()
        loadData()

    }

    


    
    fileprivate func loadData() {
        YTStatus.getStatus(since_id: 0, max_id: 0) { (models, error) in
            self.statuses = models
        }
    }
    
    
    
    
    
}

extension YTHomeController : UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView  {
        let tableView : UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64), style: UITableViewStyle.plain)
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: resusebleIdentifier)
        self.view.addSubview(tableView)
        return tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statuses!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let status = statuses?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: resusebleIdentifier, for: indexPath) as? YTStatusCell
        cell?.status = status
        return cell!
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let status = self.statuses![indexPath.row]
        if let height = rowCache[indexPath.row] {
            return height
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: resusebleIdentifier, for: indexPath) as? YTStatusCell
        
        let rowHeight = cell?.rowHeight(status: status)
        rowCache[status.id] = rowHeight
        return rowHeight!
    }
    
    
    
}













//        let customView = YTCustomView.init(frame: CGRect.init(x: 0, y: 40, width: 100, height: 100))
//        customView.backgroundColor = UIColor.green
//        view.addSubview(customView)
//        customView.btnClickClosure = {
//            //闭包没有参数 （） in 可以省略
//            print("按钮被点击")
//        }



