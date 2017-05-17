//
//  Test.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/11.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


struct PPP {
    let name : String
    init() { //常量在构造器中赋值时可以的，只要常量没在定义时赋值；
        self.name = "www"
    }
    
    init(fromName name : String) {
        self.name = name
    }
}


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


enum LightSwitch {
    case high,low,medium
    mutating func next() {
        switch self {
        case .high:
            self = .low
        case .medium:
            self = .high
        default:
            self = .low
        }
    }
}

//属性观察器
class KKK {
    var aga : Int = 0
    static var des : String = ""
    var name : String = "" {
        willSet(newName) {
            if newName.hasPrefix("p") {
                print("has p")
                return
            }
        }
        didSet {
            if name.hasPrefix("p") {
                name = "has p" + name
            }
        }
    }
    
    init(name : String) {
        self.name = name
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
    
    
    deinit {
        print("Test   deinit")
    }
    

    
}





/*构造过程
 结构体的逐一构造器
 默认构造器：属性都有默认值，但是没有构造器，系统会提供一个默认构造器，创建出的实例的属性都是默认值；
 构造过程中常量的修改
 可选属性类型
 不带外部名的构造器参数
 参数的内部名称和外部名称
 默认属性值：定义的时候赋值
 构造参数
 值类型的构造器代理
 
 类的构造过程
 指定构造器 和 便利构造器
 类的构造器代理规则
 两段式构造过程
 构造器的继承和重写
 构造器的自动继承：子类没有定义任何构造器，那么继承父类的所有构造器，2、子类提供了所有父类的指定构造器的实现，那么子类自动继承所有父类的便利构造器
 可失败构造器 init？构造出的实例是该类的可选类型
 
 枚举类型的可失败构造器
 带原始值的枚举类型的可失败构造器：自带一个可失败构造器init?(rawValue:)
 构造失败的传递：可失败构造器可以横向的代理到类型中的其他可失败构造器，子类的可失败构造器也能向上代理到父类的可失败构造器
 重写一个可失败构造器：子类可以重写父类的可失败构造器，也可以用子类的非可失败构造器重写父类的可失败构造器，反过来不可以；
 
 必要构造器：在类的构造器init前加上关键字 required 修饰符表明所有的子类都必须要实现该构造器，而且子类也必须加上关键字 required；
 通过闭包或函数设置属性的默认值：闭包或函数的返回值赋值给该属性；闭包大括号后边加了一对小括号(),表示立即执行此闭包；
 
 */

//    class SomeClass {
//        let someProperty: SomeType = {
//            // 在这个闭包中给 someProperty 创建一个默认值
//            // someValue 必须和 SomeType 类型相同
//            return someValue
//        }()
//    }



/*方法
 实例方法 类方法
 类、枚举结构体都可以定义方法
 方法可以隐式的使用内部属性，调用方法使用点语法；
 每一个实例都有一个隐形的属性self，可以使用self来引用当前实例；使用self大多情况下是参数名和实例名相同的时候；
 在实例方法中修改值类型；默认情况下枚举和结构体的属性不能在实例方法中被修改，在方法名前加上 mutating 关键字；还可以给隐含的self属性赋与一个全新的实例，新实例将替换原来的实例；
 在可变方法中给self赋值
 
 类型方法: 关键字 static
 
 
 */

/*属性 存储属性 计算属性
 计算属性可用于类、枚举、结构体，而存储属性只能用于类、结构体；
 实例属性  类属性
 常量结构体的存储属性：当把一个结构体实例赋值给一个常量时，这个结构体内的属性将不能被修改，即使属性被声明为变量var也不可以；因为结构体、枚举属于值类型；引用类型class不一样，把常量实例赋值给一个类实例，实例依然可以修改实例中的变量属性；
 延迟存储属性（懒加载）lazy； 必须声明为var，因为变量属性有可能在实例初始化完后才会赋值初始值；
 
 存储属性和实例变量；swift统一管理，没有实例变量；属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义
 
 计算属性：提供一个getter 和 一个可选的setter 来间接获取和设置其他属性或变量的值；
 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue
 只读计算属性（只有getter）可以省略 花括号{} 和 关键字 get
 
 属性观察期
 属性被设置的时候都会调用属性观察器，即使新值和旧值一样的时候也会调用；
 可以为除了延迟属性外的其他存储属性添加属性观察器；
 willSet 在新的值被设置之前调用
 didSet 在新的值被设置之后立即调用；
 
 
 类型属性：类型属性只有一份内存；
 使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父类的实现进行重写
 
 */


/*类 结构体
 
 共同点：
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 
 类的附加功能：
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 
 恒等运算符 等价于=== 不等价于!==，运用这两个运算符检测两个常量或者变量是否引用同一个实例；
 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
 
 类 结构体的选择
 
 */


/*
 枚举
 关联值
 原始值
 原始值的隐式赋值
 使用字符串作为枚举的原始值时，每个枚举成员的隐士原始值为该枚举成员本身；
 使用 rawValue 属性可以访问该枚举成员的原始值；
 使用原始值初始化枚举实例；
 递归枚举：递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型作为关联值；关键字 indirect 来表示该枚举可递归；在枚举类型前加上 indirect表示所有成员都可递归；
 
 */


/*
 下标：下标可以定义在类、结构体和枚举中，是访问集合、列表或序列中元素的快捷方式；可以使用下标的索引设置和获取值；而不需要载调用对应的存取方法；
 一个类型可以定义多个下标；通过不同索引类型进行重载
 下标 关键字 subscript ，可以设定为只读 或者 读写
 
 subscript(index: Int) -> Int {
 get {
 // 返回一个适当的 Int 类型的值
 }
 
 set(newValue) {
 // 执行适当的赋值操作
 }
 }
 
 
 只读 省略 get关键字 和 花括号
 subscript(index: Int) -> Int {
 // 返回一个适当的 Int 类型的值
 }
 
 下标可以接受任意类型的入参，这些入参可以是任意类型，返回值也可以是任意类型；
 
 */




/*
 自动引用计数
 
 解决循环引用：弱引用和无主引用
 弱引用和无主引用允许循环引用中的一个实例引用而另外一个实例不保持强引用。这样实例能够互相引用而不产生循环强引用
 当其他的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构在先时。在上面公寓的例子中，很显然一个公寓在它的生命周期内会在某个时间段没有它的主人，所以一个弱引用就加在公寓类里面，避免循环引用。相比之下，当其他实例有相同的或者更长生命周期时，请使用无主引用
 weak，ARC下会在引用的实例被销毁后自动将其赋值为nil；
 因为弱引用可以允许它们的值在运行时被赋值为nil，所以它们会被定义为可选类型变量，而不是常量。
 
 无主引用 关键字  unowned
 
 Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。
 
 Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。
 
 然而，存在着第三种场景，在这种场景中，两个属性都必须有值，并且初始化完成后永远不会为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。
 
 无主引用以及隐士解析可选属性
 
 
 闭包引起的循环强引用
 闭包捕获列表
 Swift 有如下要求：只要在闭包内使用self的成员，就要用self.someProperty或者self.someMethod()（而不只是someProperty或someMethod()）。这提醒你可能会一不小心就捕获了self
 
 定义捕获列表
 捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用（例如self）或初始化过的变量（如delegate = self.delegate!）。这些项在方括号中用逗号分开。
 如果闭包有参数列表和返回类型，把捕获列表放在它们前面：
 
 lazy var someClosure: (Int, String) -> String = {
 [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
 // 这里是闭包的函数体
 }
 
 
 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方：
 lazy var someClosure: Void -> String = {
 [unowned self, weak delegate = self.delegate!] in
 // 这里是闭包的函数体
 }
 
 在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用
 如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用。
 
 
 */


/*
 访问控制
 open 在其他应用中也可以继承、被重写
 public 只能在本应用中被继承、被重写，比如写成了动态库framework，引用此动态库的应用类不可以继承、被重写动态库内的类、结构体
 internal 默认，整个模块、应用中都可以访问，重写，继承
 fileprivate 在本文件中有效，在文件内的其他类、结构体也可以访问
 private 只在类的作用域中有效
 
 公开访问或者其他更严访问级别的类，只能在它们定义的模块内部被继承。
 公开访问或者其他更严访问级别的类成员，只能在它们定义的模块内部的子类中重写。
 开放访问的类，可以在它们定义的模块中被继承，也可以在引用它们的模块中被继承。
 开放访问的类成员，可以在它们定义的模块中子类中重写，也可以在引用它们的模块中的子类重写。
 把一个类标记为开放，显式地表明，你认为其他模块中的代码使用此类作为父类，然后你已经设计好了你的类的代
 
 
 
 
 */







