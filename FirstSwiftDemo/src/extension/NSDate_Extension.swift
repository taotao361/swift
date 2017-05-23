//
//  NSDate + Extension.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import Foundation

extension Date {
    static func dateWithString(time : String) -> Date {
        let formatter = DateFormatter.init()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        formatter.locale = Locale.init(identifier: "en")
        let createDate = formatter.date(from: time)!
        return createDate
    }
    
    //MARK: - 刚刚(一分钟内) X分钟前(一小时内) X小时前(当天) 昨天 HH:mm(昨天) MM-dd HH:mm(一年内) yyyy-MM-dd HH:mm(更早期)
    var dateDescription : String {
        
        let calender = Calendar.current
        if calender.isDateInToday(self) {
            let since = Int(Date.init().timeIntervalSince(self))
            if since < 60 {
                return "刚刚"
            } else if since < 60*60 {
                return "\(since/60)分钟前"
            } else {
                return "\(since/(60*60))小时前"
            }
        }
        
        var formatterStr = "HH:mm"
        if calender.isDateInYesterday(self) {
            formatterStr = "昨天" + formatterStr
        } else {
            formatterStr = "MM-dd" + formatterStr
            
            let comps = (calender as NSCalendar).components(NSCalendar.Unit.year, from: self, to: Date.init(), options: NSCalendar.Options.init(rawValue: 0))
            if comps.year! >= 1 {
                formatterStr = "yyyy-" + formatterStr
            }
        }
        
        let formatter = DateFormatter.init()
        formatter.dateFormat = formatterStr
        formatter.locale = Locale.init(identifier: "en")
        
        return formatter.string(from: self)
    }
    
    
    
}
