//
//  YTTopBarView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTTopBarView: UIView {

    override init(frame : CGRect) {
        super.init(frame: frame)
        
        add()
        
    }
    
    
    fileprivate func add() {
        let loginBtn = UIButton.init(frame: CGRect.init(x: 10, y: 10, width: 40, height: 30))
        loginBtn.setTitle("login", for: UIControlState.normal)
        loginBtn.setTitle("登录", for: UIControlState.highlighted)
        loginBtn.backgroundColor = UIColor.gray
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        addSubview(loginBtn)
    }
    
    @objc fileprivate func login() {
        presentLoginVC()
    }
    
    fileprivate func presentLoginVC() {
        let loginVC = YTLoginController.init()
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        rootVC?.present(loginVC, animated: true, completion: { 
            
        })
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("coder not init")
    }
    
    
    
    
    
}
