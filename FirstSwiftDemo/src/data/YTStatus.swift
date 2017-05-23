//
//  YTStatus.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class YTStatus: NSObject {

    var created_at : String? {
        didSet {
            let createDate = Date.dateWithString(time: created_at!)
            created_at = createDate.dateDescription
        }
    }
    
    //id 微博id
    var id : Int = 0
    //微博内容
    var text : String?
    //微博来源
    var source : String? {
        didSet {
            if let str = self.source {
                if str == "" {return}
                //获取开始截取的位置
                let startLocation = (str as NSString).range(of: ">").location + 1
                //获取截取的长度
                let length = (str as NSString).range(of: "<", options: NSString.CompareOptions.backwards).location - startLocation
                //截取字符串
                self.source = "来自:" + (str as NSString).substring(with: NSMakeRange(startLocation, length))
            }
        }
    }
    //是否已收藏
    var favorited : Bool?
    //是否被截断
    var truncated : Bool?
    
    //缩略图地址
    var thumbnail_pic : String?
    //中等尺寸图片地址
    var bmiddle_pic : String?
    //原始图片地址
    var origin_pic : String?
    
    //用户信息
    var user : YTUser?
    
    //配图数组
    var pic_urls : [[String:AnyObject]]? {
        didSet {
            storedPicUrls = [URL]()
            storedLargePicUrls = [URL]()
            for dic in pic_urls! {
                if  let urlStr = dic["thumbnail_pic"] {
                    storedPicUrls?.append(URL(string: urlStr as! String)!)
                    let largeURLStr = urlStr.replacingOccurrences(of: "thumbnail", with: "large")
                    storedLargePicUrls!.append(URL(string: largeURLStr)!)
                }
            }
        }
    }
    
    
    ///配图的URL
    var storedPicUrls : [URL]?
    
    ///配图的大图URL
    var storedLargePicUrls : [URL]?
    
    ///转发微博
    var retweeted_status : YTStatus?
    
    //配图数组
    var pictureUrls : [URL]?
    
    class func getStatus(since_id : Int,max_id : Int,finish : @escaping (_ models : [YTStatus]?,_ error : NSError?) ->Void) {
        var paras : [String : Any] = ["access_token" : YTUserAccount.getAccount()!.access_token!]
        if since_id > 0 {
            paras["since_id"] = "\(since_id)"
        }
        if max_id > 0 {
            paras["max_id"] = "\(max_id)"
        }
        let url = "https://api.weibo.com/2/statuses/home_timeline.json"
        Alamofire.request(url, method: .get, parameters: paras, encoding: URLEncoding.default, headers: nil).responseJSON { (Response) -> Void in
            print("获取数据成功 ============== \(Response.result.debugDescription)")
        
            if Response.result.value != nil {
                let resultData = Response.result.value as! [String : AnyObject]
                let models = YTStatus.dicToModel(resultData["statuses"] as! [[String : AnyObject]])
                YTStatus.cacheStatusImages(models, finish: finish)
            }
        }
    }
    
    
    class func dicToModel(_ dicList : [[String : AnyObject]]) -> [YTStatus] {
        var models = [YTStatus]()
        for dic in dicList {
            models.append(YTStatus.init(dic: dic))
        }
        return models
    }
    
    //构造器
    init(dic : [String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    //
    override func setValue(_ value: Any?, forKey key: String) {
        if "user" == key {
            user = YTUser.init(dic: value as! [String : AnyObject])
            return
        }
        if "retweeted_status" == key {
            retweeted_status = YTStatus.init(dic: value as! [String : AnyObject])
            return
        }
        super.setValue(value, forKey: key)
    }
    
    //没定义的key
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    //缓存配图
    class func cacheStatusImages(_ list : [YTStatus],finish : @escaping (_ models : [YTStatus]?,_ error : NSError?) -> Void) {
        let group = DispatchGroup()
        for status in list {
            guard let _ = status.pictureUrls else {
                continue
            }
            for url in status.pictureUrls! {
                group.enter()
                
                let downLoader = KingfisherManager.shared.downloader
                downLoader.downloadImage(with: url, retrieveImageTask: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, imageUrl, originData) in
                    if let image = image,let imageUrl = imageUrl {
                        ImageCache.default.store(image, forKey: imageUrl.absoluteString)
                    }
                    group.leave()
                })
                
            }
        }
        
        group.notify(queue: DispatchQueue.main) { 
            finish(list,nil)
        }
    }
    
    
    
    
}

/**
 获取当前登录用户及其所关注（授权）用户的最新微博
 URL
 https://api.weibo.com/2/statuses/home_timeline.json
 请求方式 GET
 参数
 必选	类型及范围	说明
 access_token 	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
 since_id	false	int64	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
 max_id	false	int64	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
 count	false	int	单页返回的记录条数，最大不超过100，默认为20。
 page	false	int	返回结果的页码，默认为1。
 base_app	false	int	是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0。
 feature	false	int	过滤类型ID，0：全部、1：原创、2：图片、3：视频、4：音乐，默认为0。
 trim_user	false	int	返回值中user字段开关，0：返回完整user字段、1：user字段仅返回user_id，默认为0。
 
 
 
 
 */






