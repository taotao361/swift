//
//  YTStatusTopView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit
import SnapKit


class YTStatusTopView: UIView {


    var status : YTStatus? {
        didSet {
            nameLabel.text = status?.user?.name
            if let url = status?.user?.imageUrl {
                iconView.kf.setImage(with: url)
            }
            verifiedView.image = status?.user?.verifiedImage
            vipView.image = status?.user?.mbrankImage
            sourceLabel.text = status?.source
            timeLabel.text = status?.created_at
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func loadUI() {
        self.addSubview(iconView)
        self.addSubview(verifiedView)
        self.addSubview(nameLabel)
        self.addSubview(vipView)
        self.addSubview(sourceLabel)
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.height.width.equalTo(50)
        }
        
        verifiedView.snp.makeConstraints { (make) in
            make.right.equalTo(iconView).offset(5)
            make.bottom.equalTo(iconView).offset(5)
            make.height.width.equalTo(14)
        }
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(iconView)
            make.left.equalTo(iconView.snp.right).offset(10)
        }
        
        vipView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nameLabel)
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.height.width.equalTo(14)
        }
        
        timeLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconView)
            make.left.equalTo(iconView.snp.right).offset(10)
        }
        
        sourceLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(timeLabel)
            make.left.equalTo(timeLabel.snp.right)
        }
        
    }
    
    
    
    
    //头像
    fileprivate lazy var iconView : UIImageView = UIImageView.init(image: UIImage.init(named: "avatar_default_big"))
    
    //认证图标
    fileprivate lazy var verifiedView : UIImageView = UIImageView.init(image: UIImage.init(named: "avatar_enterprise_vip"))
    
    //昵称
    fileprivate lazy var nameLabel : UILabel = {
        var label = UILabel.init()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //会员图标
    fileprivate lazy var vipView : UIImageView = UIImageView.init(image: UIImage.init(named: "common_icon_membership"))
    
    //时间
    fileprivate lazy var timeLabel : UILabel = {
        let label = UILabel.init()
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //来源
    fileprivate lazy var sourceLabel : UILabel = {
        let label = UILabel.init()
        label.textColor = UIColor.purple
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    
    
    
}
