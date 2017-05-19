//
//  YTRootTabBarController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/16.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


class YTRootTabBarController: UITabBarController {

    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController()
        print("YTRootTabBarController")
        
    }

    
    
    fileprivate func addChildViewController () {
        addViewController(childVC: YTHomeController(), title: "首页", imageName: "tabbar_home")
        addViewController(childVC: YTMessageController(), title: "消息", imageName: "tabbar_message_center")
        self.addChildViewController(UIViewController.init()) //占位
        addViewController(childVC: YTDiscoverController.init(), title: "发现", imageName: "tabbar_discover")
        addViewController(childVC: YTProfileController.init(), title: "我的", imageName: "tabbar_profile")
    }
    
    
    fileprivate func addViewController(childVC : UIViewController,title : String,imageName : String) {
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage.init(named: imageName + "_highlighted")
        childVC.title = title
        self.addChildViewController(childVC)
    }
    
    //MARK:--- 加载中间按钮
    //计算中间按钮的frame
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let width = UIScreen.main.bounds.width/CGFloat(self.viewControllers!.count)
        let rect = CGRect.init(x: 0, y: 0, width: width, height: 49)
        publishBtn.frame = rect.offsetBy(dx: width*2, dy: 0)
    }
    
    //MARK:---懒加载中间按钮
    fileprivate var publishBtn : UIButton  {
        let btn : UIButton = UIButton.init()
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(self.btnClick), for: UIControlEvents.touchUpInside)
        self.tabBar.addSubview(btn)
        return btn
    }
    
    
    //发表按钮点击
    @objc fileprivate func btnClick () {
        let publishVC = YTPublishController.init()
        self.present(publishVC, animated: true) { 
            
        }
    }
    

    
    
    

    
}
