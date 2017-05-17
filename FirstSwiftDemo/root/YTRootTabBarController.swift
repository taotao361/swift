//
//  YTRootTabBarController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/16.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


//访问控制
class UUU {
    private var name : String
    fileprivate var age  : Int?
    public var money : Double = 100.9
    init(name : String) {
        self.name = name
    }
}

//fileprivate 文件内私有，脱离了这个文件就访问不了
//private 类内私有，出了类的作用域就不能访问


class YTRootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        print("==============")
        
        
        let u = UUU.init(name : "ppp")
        u.age = 9

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
