//
//  YTTopBarView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

enum TopBarType {
    case login
    case home
    case message
    case discover
    case profile
    case publish
}


class YTTopBarView: UIView {
    
    init(type : TopBarType?,frame : CGRect) {
        super.init(frame: frame)
            add(type: type)
    }
    
    
    
    fileprivate func add(type : TopBarType?) {
        
        let label = UILabel.init(frame: CGRect.init(x: (UIScreen.main.bounds.size.width-60)/2, y: 20, width: 60, height: 30))
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 16)
        addSubview(label)
        
        if type == nil { return }
        let barType = type!
        switch barType {
        case .login:
            label.text = "登录"
            addLoginBtn()
        case .discover:
            label.text = "发现"
            print("discover")
        case .home:
            label.text = "首页"
            print("home")
        case .message:
            label.text = "消息"
            print("message")
        case .profile:
            label.text = "我的"
            print("profile")
        case .publish:
            label.text = "发表"
            print("发表")
        }
    }
    
    fileprivate func addLoginBtn () {
        let loginBtn = UIButton.init(frame: CGRect.init(x: 10, y: 20, width: 40, height: 30))
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
