//
//  YTTestView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/16.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

let identifier = "YTFirstCell"

extension YTTestView {
    
    
}


class YTTestView: UIView,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView
//    let model  : YTTestModel = YTTestModel.init(name: "pppp", detail: "haha")
    
    
    
    
    
    override init(frame: CGRect) {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 20, width: 320, height: 568-20), style: UITableViewStyle.plain)
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.tableView = UITableView.init()
        super.init(coder: aDecoder)
    }

    
    func initUI () {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(YTFirstCell.self, forCellReuseIdentifier: identifier)
        self.addSubview(self.tableView)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? YTFirstCell
        cell?.labe1.text = "haha"
        cell?.label2.text = "ppp"
        return (cell)!
        
    }
    
    
    
    
    
    
    
    
    
    
}
