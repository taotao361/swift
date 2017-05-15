//
//  Test.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/11.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


public class Car {
    var name = "ppp"
    var price = "4232432"
    private func printName () {
        print(name)
    }
    fileprivate func printPrice () {
        print(price)
    }
    
}

fileprivate class SmallCar : Car {
    var brand = "benci"
}

private class BigCar : Car {
    
}


protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    //类属性
    static var someTypeProperty: Int { get set }
}

protocol Bprotocol {
    static var name : String {get set}
}

//枚举 CompassPoint 被明确指定为 public 级别，那么它的成员 North、South、East、West 的访问级别同样也是 public
public enum CompassPoint {
    case east
    case west
    case north
    case sorth
}


extension Test {
    class HAHA {
        let name : String
        init(name : String) {
            self.name = name
        }
    }
    
    enum BBB {
        case A
        case B
        case C
    }

    func goToSwimming()  {
        print("go to swimming")
    }
    
}


//public class QQQ {
//    private func someMethod() {}
//}
//
//class WWW : QQQ {
//    override  func someMethod() {
//        super.somemethod()
//    }
//}







class Test: NSObject {
    
    var count = 0
    var money = 10.0
    var hobby = ["pingpang","basketBall","soccer"]
    
   init(money : Double,count : Int) {
        self.count = count
        self.money = money
    }
    
    func goToSport() -> Void {
        print("去运动")
    }
    
    func play(givenMoney : Double) {
        print("============= \(givenMoney)")
    }
    
    
}
