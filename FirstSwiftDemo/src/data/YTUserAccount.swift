//
//  YTUserData.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/19.
//  Copyright © 2017年 yangxutao. All rights reserved.
//


/*根据用户ID获取用户信息
 url https://api.weibo.com/2/users/show.json
 请求方式 GET
 请求参数
 必选	类型及范围	说明
 access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
 uid	false	int64	需要查询的用户ID。
 screen_name	false	string	需要查询的用户昵称。

 参数uid与screen_name二者必选其一，且只能选其一；
 接口升级后，对未授权本应用的uid，将无法获取其个人简介、认证原因、粉丝数、关注数、微博数及最近一条微博内容。
 
 
 
 返回值字段	字段类型	字段说明
 id	int64	用户UID
 idstr	string	字符串型的用户UID
 screen_name	string	用户昵称
 name	string	友好显示名称
 province	int	用户所在省级ID
 city	int	用户所在城市ID
 location	string	用户所在地
 description	string	用户个人描述
 url	string	用户博客地址
 profile_image_url	string	用户头像地址（中图），50×50像素
 profile_url	string	用户的微博统一URL地址
 domain	string	用户的个性化域名
 weihao	string	用户的微号
 gender	string	性别，m：男、f：女、n：未知
 followers_count	int	粉丝数
 friends_count	int	关注数
 statuses_count	int	微博数
 favourites_count	int	收藏数
 created_at	string	用户创建（注册）时间
 following	boolean	暂未支持
 allow_all_act_msg	boolean	是否允许所有人给我发私信，true：是，false：否
 geo_enabled	boolean	是否允许标识用户的地理位置，true：是，false：否
 verified	boolean	是否是微博认证用户，即加V用户，true：是，false：否
 verified_type	int	暂未支持
 remark	string	用户备注信息，只有在查询用户关系时才返回此字段
 status	object	用户的最近一条微博信息字段 详细
 allow_all_comment	boolean	是否允许所有人对我的微博进行评论，true：是，false：否
 avatar_large	string	用户头像地址（大图），180×180像素
 avatar_hd	string	用户头像地址（高清），高清头像原图
 verified_reason	string	认证原因
 follow_me	boolean	该用户是否关注当前登录用户，true：是，false：否
 online_status	int	用户的在线状态，0：不在线、1：在线
 bi_followers_count	int	用户的互粉数
 lang	string	用户当前的语言版本，zh-cn：简体中文，zh-tw：繁体中文，en：英语

 
 
 */



import UIKit
import Alamofire


//遵守归档协议
class YTUserAccount: NSObject,NSCoding {

    //全局类属性
    static var userAccount : YTUserAccount?
    
    var access_token : String?
    var expires_in : NSNumber? {
        didSet {
            expires_date = Date.init(timeIntervalSinceNow: expires_in!.doubleValue)
        }
    }
    //过期时间
    var expires_date : Date?
    var uid : String?
    var avatar_large : String?
    var screen_name : String?
    
    //构造器
    init(dic : [String:AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    //字典中有缺少值不会报错
    //当为不存在的某个键设值时，默认调用该方法抛出 NSUndefinedKeyException 异常，子类可重写该方法：
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("----\(value as AnyObject) ----- \(key)")
    }
    
    //存储登录信息 plist
    static let  filePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!.appending("/account.plist")
    
    
    
    
    //保存用户信息
    func saveAccount() {
        NSKeyedArchiver.archiveRootObject(self, toFile: YTUserAccount.filePath)
    }
    
    //获取用户信息
    static func getAccount() ->YTUserAccount? {
        if YTUserAccount.userAccount != nil {
            return YTUserAccount.userAccount
        }
        YTUserAccount.userAccount = NSKeyedUnarchiver.unarchiveObject(withFile: YTUserAccount.filePath) as? YTUserAccount
        if YTUserAccount.userAccount?.expires_date?.compare(Date.init()) == ComparisonResult.orderedAscending {
            //过期
            return nil
        }
        return YTUserAccount.userAccount
    }
    
    //判断用户是否登录
    func accountLogin() -> Bool {
        return YTUserAccount.getAccount()  != nil
    }
    
    

    //归档
    func encode(with coder: NSCoder) {
        coder.encode(access_token, forKey: "access_token")
        coder.encode(expires_in, forKey: "expires_in")
        coder.encode(uid, forKey: "uid")
        coder.encode(screen_name, forKey: "screen_name")
        coder.encode(avatar_large, forKey: "avatar_large")
    }
    
    //解档
    required init?(coder decoder: NSCoder) {
        access_token = decoder.decodeObject(forKey: "access_token") as? String
        expires_in = decoder.decodeObject(forKey: "expires_in") as? NSNumber
        uid = decoder.decodeObject(forKey: "uid") as? String
        screen_name = decoder.decodeObject(forKey: "screen_name") as? String
        avatar_large = decoder.decodeObject(forKey: "avatar_large") as? String
    }

    
    
    
    /// 获取用户信息
    func getAccountData(_ finish : @escaping (_ acccount : YTUserAccount?,_ error : NSError?) ->()) {
        let paras = ["access_token":access_token!,"uid":uid!]
        Alamofire.request("https://api.weibo.com/2/users/show.json", method: .get, parameters: paras, encoding: URLEncoding.default, headers: nil).responseJSON { (Response) -> Void in
            if let dic = Response.result.value as? [String:AnyObject] {
                self.screen_name = dic["screen_name"] as? String
                self.avatar_large = dic["avatar_large"] as? String
                finish(self,nil)
            } else {
                finish(nil,Response.result.error! as NSError)
            }
            print("===== \(Response.result.value!)")
        }
        finish(nil,nil)
    }
    
    
    
}



/*
 
 "allow_all_act_msg" = 0;
 "allow_all_comment" = 1;
 "avatar_hd" = "http://tvax2.sinaimg.cn/default/images/default_avatar_male_180.gif";
 "avatar_large" = "http://tvax2.sinaimg.cn/default/images/default_avatar_male_180.gif";
 "bi_followers_count" = 0;
 "block_app" = 0;
 "block_word" = 0;
 city = 1000;
 class = 1;
 "created_at" = "Fri Apr 07 19:06:41 +0800 2017";
 "credit_score" = 80;
 description = "";
 domain = "";
 "favourites_count" = 0;
 "follow_me" = 0;
 "followers_count" = 1;
 following = 0;
 "friends_count" = 49;
 gender = m;
 "geo_enabled" = 1;
 id = 6198840045;
 idstr = 6198840045;
 insecurity =     {
 "sexual_content" = 0;
 };
 lang = "zh-cn";
 location = "\U5317\U4eac";
 mbrank = 0;
 mbtype = 0;
 name = "\U8c6a\U653e\U7684haha";
 "online_status" = 0;
 "pagefriends_count" = 0;
 "profile_image_url" = "http://tvax2.sinaimg.cn/default/images/default_avatar_male_50.gif";
 "profile_url" = "u/6198840045";
 province = 11;
 ptype = 0;
 remark = "";
 "screen_name" = "\U8c6a\U653e\U7684haha";
 star = 0;
 "statuses_count" = 0;
 urank = 0;
 url = "";
 "user_ability" = 0;
 verified = 0;
 "verified_reason" = "";
 "verified_reason_url" = "";
 "verified_source" = "";
 "verified_source_url" = "";
 "verified_trade" = "";
 "verified_type" = "-1";
 weihao = "";
 
 */


