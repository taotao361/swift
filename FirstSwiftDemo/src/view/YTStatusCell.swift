//
//  YTStatusCell.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTStatusCell: UITableViewCell {

    lazy var pictureSize : CGSize = CGSize.zero
    
    var status : YTStatus? {
        didSet {
            topView.status = status
            contentLabel.text = status?.text
            pictureView.status = status?.retweeted_status != nil ? status?.retweeted_status : status
            pictureSize = pictureView.calculateImageSize()
            pictureView.snp.makeConstraints { (make) in
                make.height.equalTo(pictureSize.height)
                make.width.equalTo(pictureSize.width)
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func loadUI () {
        self.contentView.addSubview(topView)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(pictureView)
        self.contentView.addSubview(bottomView)
        
        let width = UIScreen.main.bounds.width
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView)
            make.width.equalTo(width)
            make.height.equalTo(60)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.left.equalTo(topView.snp.left).offset(10)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.width.equalTo(width)
            make.top.equalTo(pictureView.snp.bottom).offset(10)
            make.height.equalTo(44)
            make.left.equalTo(self.contentView.snp.left)
        }
    }
    
    func rowHeight(status : YTStatus) -> CGFloat {
        self.status = status
        self.layoutIfNeeded()
        return bottomView.frame.maxY
    }
    
    
    //topView
    fileprivate lazy var topView : YTStatusTopView = YTStatusTopView.init()
    //contentLabel
    lazy var contentLabel : UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.red
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 20
        return label
    }()
    
    //pictureView
    fileprivate lazy var pictureView : YTStatusPictureView = YTStatusPictureView.init()
    
    //bottomView
    fileprivate lazy var bottomView : YTStatusBottomView = YTStatusBottomView.init()
    
    
    
    
    
    
    

}
