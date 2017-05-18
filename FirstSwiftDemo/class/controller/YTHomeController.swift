//
//  YTHomeController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTHomeController: YTRootViewController {

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let customView = YTCustomView.init(frame: CGRect.init(x: 0, y: 40, width: 100, height: 100))
        customView.backgroundColor = UIColor.green
        view.addSubview(customView)
        
        customView.btnClickClosure = {
            //闭包没有参数 （） in 可以省略
            print("按钮被点击")
        }
        
        
        print("home view controller")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
    
    
    
    
}
