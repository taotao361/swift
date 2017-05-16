//
//  YTTestModel.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/16.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


class YTTestModel: NSObject {
    var name : String?
    var detail : String?

    
    init(name : String,detail : String) {
        self.name = name
        self.detail = detail
    }
}
