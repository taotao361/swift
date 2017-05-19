//
//  YTLoginController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

/*OAuth2的authorize接口
 url https://api.weibo.com/oauth2/authorize
 请求方式 GET/POST
 
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
 scope	false	string	申请scope权限所需参数，可一次申请多个scope权限，用逗号分隔。使用文档
 state	false	string	用于保持请求和回调的状态，在回调时，会在Query Parameter中回传该参数。开发者可以用这个参数验证请求有效性，也可以记录用户请求授权页前的位置。这个参数可用于防止跨站请求伪造（CSRF）攻击
 display	false	string	授权页面的终端类型，取值见下面的说明。
 forcelogin	false	boolean	是否强制用户重新登录，true：是，false：否。默认false。
 language	false	string	授权页语言，缺省为中文简体版，en为英文版。英文版测试中，开发者任何意见可反馈至 @微博API
 
 display说明：
 参数取值	类型说明
 default	默认的授权页面，适用于web浏览器。
 mobile	移动终端的授权页面，适用于支持html5的手机。注：使用此版授权页请用 https://open.weibo.cn/oauth2/authorize 授权接口
 wap	wap版授权页面，适用于非智能手机。
 client	客户端版本授权页面，适用于PC桌面应用。
 apponweibo	默认的站内应用授权页，授权后不返回access_token，只刷新站内应用父框架。
 
 返回数据
 返回值字段	字段类型	字段说明
 code	string	用于第二步调用oauth2/access_token接口，获取授权后的access token。
 state	string	如果传递参数，会回传该参数。
 */


/*OAuth2的access_token接口
 url https://api.weibo.com/oauth2/access_token
 请求方式 POST
 请求参数
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 
 grant_type为authorization_code时
 必选	类型及范围	说明
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
 
 返回数据
 返回值字段	字段类型	字段说明
 access_token	string	用户授权的唯一票据，用于调用微博的开放接口，同时也是第三方应用验证微博用户登录的唯一票据，第三方应用应该用该票据和自己应用内的用户建立唯一影射关系，来识别登录状态，不能使用本返回值里的UID字段来做登录识别。
 expires_in	string	access_token的生命周期，单位是秒数。
 remind_in	string	access_token的生命周期（该参数即将废弃，开发者请使用expires_in）。
 uid	string	授权用户的UID，本字段只是为了方便开发者，减少一次user/show接口调用而返回的，第三方应用不能用此字段作为用户登录状态的识别，只有access_token才是用户授权的唯一票据。
 
 示例
 {
 "access_token": "ACCESS_TOKEN",
 "expires_in": 1234,
 "remind_in":"798114",
 "uid":"12341234"
 }

 */







import UIKit
import Alamofire


class YTLoginController: YTRootViewController {

    let SCREEN_WIDTH = UIScreen.main.bounds.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    let App_Key = "4131640539"
    let App_Secret = "43fab01c6e60e3d328d5b87fd7f7edbd"
    let App_Redirect_Url = "www.baidu.com"

    
    override func loadView() {
        super.loadView()
        topBarType = TopBarType.login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = addWebView()
        
        //拼接授权地址
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(App_Key)&redirect_uri=\(App_Redirect_Url)"
        let url = URL.init(string: urlString)
        let request = URLRequest.init(url: url!)
        webView.loadRequest(request)
        
    }

    
    func addWebView() -> UIWebView {
        let webView = UIWebView.init(frame: CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64))
        webView.delegate = self
        view.addSubview(webView)
        return webView
    }

}



// MARK: - 获取token需要两步 1、使用authorize接口获取code；2、使用第一步拿到的code获取授权token

extension YTLoginController : UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let isHas = request.url!.absoluteString.contains(App_Redirect_Url+"/?code=")
        print(request.url!.absoluteString,isHas)
        if isHas {
            //获取code
            let codeString = request.url?.absoluteString.components(separatedBy: "=").last
            //获取token
            getAccessToken(code: codeString)
            return false
        }
        return true
    }
    
    
    func getAccessToken(code : String?) {
        if code == nil { return }
        let paras = ["client_id":App_Key,"client_secret":App_Secret,"grant_type":"authorization_code","code":code!,"redirect_uri":App_Redirect_Url]
        let url = "https://api.weibo.com/oauth2/access_token"
        Alamofire.request(url, method:.post, parameters: paras, encoding:URLEncoding.default, headers: nil).responseJSON { (Response) -> Void in
            print("============ \(Response.result.debugDescription)")
            let account = YTUserAccount.init(dic: Response.result.value as! [String:AnyObject])
            account.getAccountData({ (account, error) in
                if account != nil {
                    account?.saveAccount()
                    //发出切换控制器通知
                    let notification = Notification.init(name: Notification.Name.init(rawValue: SwitchRootViewControllerKey))
                    NotificationCenter.default.post(notification)
                }
            })
        }
    }
    
    /*
     "access_token" = "2.00DThVlGX8wbVEd2a08786d3oHKq_C";
     "expires_in" = 157679999;
     "remind_in" = 157679999;
     uid = 6198840045;
     */
    
    
}





