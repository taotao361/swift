//
//  YTDiscoverController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/18.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

struct HHHHH {
    
    static var name : String?
    static func aaa() {
        
    }
    
}



class YTDiscoverController: YTRootViewController {

    var math : Double = 0.0
    var english : Double = 0.0
    var average : Double {
        get {
            return (math + english) / 2
        }
    }
    

    
    //类方法在类中使用 static class 都可以，但是计算属性使用class，存储属性使用static
    //结构体中必须使用static
    static func aaa() {
        
    }
    class func bbb() {
        
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.yellow
        topBarType = TopBarType.discover
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        math = 90.9
        english = 80.3
        print(average)


     /**位运算符
         按位与 &
         按位或 |
         按位异或 ^
         按位取反 ~
         按位左移 <<
         按位右移 >>

        */
        
//        NSNotification
//        Notification
//        Void
//        //Optional<type> 可以使用语法糖 ?
//        let ppp : Optional<String>
//        let ppp : String?
//        //隐士解析可选类型 可用语法糖 ！表示
        
//        print(#file)
//        print(#function)
//        print(#line)
//        print(#column)
        
//        do {
//            try <#throwing expression#>
//        } catch <#pattern#> {
//            <#statements#>
//        }
        
        
        
        
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
    
//    if #available() {
//    
//    }

}



//#if
//os(iOS)
//
//#elseif
//
//#else
//
//#endif


