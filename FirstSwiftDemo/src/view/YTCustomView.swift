//
//  YTCustomView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

typealias ButtonClickClosure = () -> Void

class YTCustomView: UIView {

    //定义闭包，按钮点击监听
    var btnClickClosure : ButtonClickClosure?
    
    override init(frame : CGRect) {
        super.init(frame : frame)
        
        let button = UIButton.init(frame: CGRect.init(x: 10, y: 20, width: 40, height: 40))
        button.setTitle("haha", for: UIControlState.normal)
        button.setTitle("哈哈", for: UIControlState.highlighted)
        button.addTarget(self, action: #selector(buttonDidClick), for: UIControlEvents.touchUpInside)
        self.addSubview(button)
        
    }

    func buttonDidClick() {
        if btnClickClosure != nil {
            //属性btnClickBlock是可选类型，需要先解包
            btnClickClosure!()
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been impleted")
    }
    
    
    
}
