//
//  Test.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/11.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


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
