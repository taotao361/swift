//
//  YTPublishController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTPublishController: YTRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "发表"
        print("发表")
        
        
        let btn = UIButton.init()
        btn.frame = CGRect.init(x: 40, y: 50, width: 40, height: 40)
        btn.setTitle("back", for: UIControlState.normal)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(self.goBack), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @objc fileprivate func goBack () {
        self.dismiss(animated: true) { 
            
        }
    }
    
    
    

}
