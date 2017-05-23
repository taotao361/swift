//
//  YTRootViewController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTRootViewController: UIViewController {

    var topBarType : TopBarType?
    var topBar : YTTopBarView?
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topBar = YTTopBarView.init(type: topBarType, frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        topBar.backgroundColor = UIColor.gray
        self.topBar = topBar
        view.addSubview(topBar)
    }




    
    
}
