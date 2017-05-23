//
//  YTStatusBottomView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTStatusBottomView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(retweetBtn)
        self.addSubview(supportBtn)
        self.addSubview(commanBtn)
        
        let width = UIScreen.main.bounds.width / 3
        
        retweetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.height.equalTo(self).offset(-3)
            make.width.equalTo(width)
        }
        
        supportBtn.snp.makeConstraints { (make) in
            make.top.equalTo(retweetBtn.snp.top)
            make.height.width.equalTo(retweetBtn)
            make.left.equalTo(retweetBtn.snp.right)
        }
        
        commanBtn.snp.makeConstraints { (make) in
            make.top.equalTo(retweetBtn.snp.top)
            make.height.width.equalTo(retweetBtn)
            make.left.equalTo(supportBtn.snp.right)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func loadUI () {
        self.backgroundColor = UIColor.init(white: 0.902, alpha: 0.5)
        
    }
    
    
    //懒加载三个按钮
    fileprivate lazy var retweetBtn : UIButton = UIButton.createBtn("timeline_icon_retweet", title: "转发")
    fileprivate lazy var supportBtn : UIButton = UIButton.createBtn("timeline_icon_unlike", title: "赞")
    fileprivate lazy var commanBtn : UIButton = UIButton.createBtn("timeline_icon_comment", title: "评论")
    

    
    
}

extension UIButton {
    class func createBtn(_ imageNamed : String,title : String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageNamed), for: UIControlState())
        btn.setTitle(title, for: UIControlState())
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), for: UIControlState())
        btn.setTitleColor(UIColor.darkGray, for: UIControlState())
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return btn
    }
}


