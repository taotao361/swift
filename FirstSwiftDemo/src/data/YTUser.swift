//
//  YTUser.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

class YTUser: NSObject {

    var id : Int = 0
    /// 友好显示名称
    var name : String?
    //昵称
    var screen_name : String?
    /// 用户头像
    var profile_image_url : String? {//属性观察器
        didSet {
            if let urlStr = profile_image_url {
                imageUrl = URL.init(string: urlStr)
            }
        }
    }
    
    var imageUrl : URL?
    //是否认证
    var verified : Bool = false
    
    /// -1未认证  0:认证用户，2,3,5: 企业认证，220: 达人
    var verified_type : Int = -1 {
        didSet {
            switch verified_type {
            case 0:
                verifiedImage = UIImage.init(named: "avatar_vip")
            case 2,3,5:
                verifiedImage = UIImage.init(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage.init(named: "avatar_grassroot")
            default:
                verifiedImage = nil
            }
        }
    }
    
    //认证图片
    var verifiedImage : UIImage?
    
    //性别
    var gender : String = "n" {
        didSet {
            switch gender {
            case "m":
                gender = "男"
                case "n":
                gender = "女"
            default:
                gender = "未知"
            }
        }
    }
    
    /// 会员等级
    var mbrank: Int = 0
    {
        didSet{
            if mbrank > 0 && mbrank < 7
            {
                mbrankImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    ///会员图片
    var mbrankImage: UIImage?

    
    //粉丝数
    var followers_count : Int = 0
    //关注数
    var friends_count : Int = 0
    //微博数
    var statuses_count : Int = 0
    //收藏数
    var favourites_count : Int = 0
    
    //是否允许给我发私信
    var allow_all_act_msg  = false
    //是否允许标识用户 的位置
    var geo_enabled = false
    //是否允许所有人对我的微博进行评论
    var allow_all_comment = false
    
    //用户头像（大图）
    var avatar_large : String?
    //高清头像
    var avatar_hd : String?
    //认证原因
    var verified_reason : String?
    
    //该用户是否关注当前登录用户
    var follow_me = false
    
    //用户的在线状态
    var online_status : Int?
    //用户当前的语言版本
    var lang : String?
    
    init(dic : [String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
