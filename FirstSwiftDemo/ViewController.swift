//
//  ViewController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/4.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


//typealias NNNNN = String //别名

protocol ViewControllerDelegate {
    
}


extension ViewController : ViewControllerDelegate {

}


extension String {
    
}

extension Double {
    var km : Double { return self * 1000.0 }
    var m : Double { return self }
    var cm : Double { return self / 100.0 }
    var mm : Double  {return self / 1000.0 }
    var ft : Double { return self / 3.28084 }
    
}

extension Int {
    func repeatCount(task : ()->Void) -> Void {
        for _ in 1..<self {
            task()
        }
    }
}

extension Int {
    mutating func square () {
        self = self * self
    }
}

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

//枚举名大写开头，成员小写开头
enum MoveMent {
    case Right
    case Left
    case Up
    case Down
}

enum Direct : String {
    case north,east,west,sorth
}


//原始值 原始类型为Int
// 映射到整型
enum Movement: Int {
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3

}

// 同样你可以与字符串一一对应
enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}

// 或者float double都可以(同时注意枚举中的花式unicode)
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}

//关联值
//“定义一个名为Barcode的枚举类型，它的一个成员值是具有(Int，Int，Int，Int)类型关联值的upc，另一个成员值是具有String类型关联值的qrCode。”
enum Barcode {
    case upc(Int,Int,Int,Int)
    case qr(String)
    
}

//递归枚举
enum Expression {
    case number(Int)
    indirect case add(Expression,Expression)
    indirect case multiply(Expression,Expression)
}







/*
 疑问：
 1、带原始值的枚举类型的可失败构造器
 2、闭包使用
 3、自动引用计数
 4、
 5、
 
 
 */



extension  String {
    func description () {
        print(self)
    }
    
    mutating func add (a : String) {
        self = self + a
    }
}




// MARK: -
//该例子为 Int 添加了嵌套枚举。这个名为 Kind 的枚举表示特定整数的类型。具体来说，就是表示整数是正数、零或者负数。
//这个例子还为 Int 添加了一个计算型实例属性，即 kind，用来根据整数返回适当的 Kind 枚举成员。

// MARK: - 嵌套类型
extension Int {
    enum Kind { //嵌套枚举
        case Negative,Zero,Positive
    }
    
//    class Des { //嵌套类
//        func descriptionClass() {
//            print("\(self) 是嵌套在整型类型的 类 的方法")
//        }
//    }
//    struct AnotherStruct { //嵌套结构体
//        func discriptionStruct()  {
//            print("\(self) 是嵌套在整形类型 的 结构体 的 方法")
//        }
//    }
    
    var kind : Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0 :
            return .Positive
        default:
            return .Negative
        }
    }
    
}

extension A {
    func appenName (last : String) {
        let name = firstName + last
        print("名字为 \(name) ")
    }
    
//    class B {
//        func bName() {
//            print("bName")
//        }
//    }
}

class A {
    var firstName = ""
    func getName () {
        print("A 的 firstName 是 \(firstName)")
    }
}


struct BlackjackCard {
    //嵌套枚举
    enum Suit : Character {
        case Spades = "♠️",Hearts = "♥️",Diamonds = "♦️",Clubs = "♣️"
    }
    //
    enum Rank : Int {
        case Two = 2,Three,Four,FIve,Six,Seven,Eight,Nine,Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first : Int,second : Int?
        }
        var values : Values {
            switch self {
            case .Ace:
                return Values.init(first: 1, second: 11)
            case .Jack,.Queen,.King:
                return Values.init(first: 10, second: nil)
            default:
                return Values.init(first: self.rawValue, second: nil)
            }
        }
    }
    
    //BlackjackCard 属性 和 方法
    let rank : Rank,suit : Suit
    var description : String  {
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += "or \(second)"
        }
        return output
    }
}


//协议
//只含有一个实例属性要求的协议
//FullyNamed 协议除了要求遵循协议的类型提供 fullName 属性外，并没有其他特别的要求。这个协议表示，任何遵循 FullyNamed 的类型，都必须有一个可读的 String 类型的实例属性 fullName。
protocol FullyNamed {
    var fullName: String { get }
}


protocol Togglable {
    mutating func toggle()
}



//构造器协议
protocol GeneratorProtocol {
    init(name : String)
}

protocol PeopleProtocol {
    init()
}

//委托模式
//骰子游戏
protocol DiceGame {
    var dice : Dice {get}
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game : DiceGame)
    func game(_ game : DiceGame,didStartNewTurnWithRoll diceRoll : Int)
    func gameDidEnd(_ game : DiceGame)
}

protocol RandomNumberGenerator {
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

class Dice {
    let sides : Int
    let generator : RandomNumberGenerator
    init(sides : Int,generator : RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll () -> Int {
        return Int(generator.random() * Double(sides)) + 1 //类型转换 Int()
    }
}

class SnakesAndLadders : DiceGame {
    let finalSquare = 25
    let dice = Dice.init(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board : [Int]
    init() {
        board = [Int].init(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate : DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop : while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}



//类类型专属协议
protocol PrivateProtocol : class {
    
}

//类类型的协议不能被结构体 枚举遵循
//struct PPPPPP : PrivateProtocol {
//    var name : String
//}


protocol GroupProtocol {
    func test()
}

class BBB: GroupProtocol {
    func test() {
        print("BBB test")
    }
}
class CCC: GroupProtocol {
    func test() {
        print("CCC test")
    }
}

class DDD: GroupProtocol {
    func test() {
        print("DDD test")
    }
}


//泛型

struct Type<Element> {
    var items = [Element]()
    mutating func push(_ a : Element) {
        items.append(a)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}


extension Type {
    var topItem : Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


//关联类型
protocol Container {
    associatedtype itemType
    var count : Int { get }
    mutating func appending(_ item : itemType)
    subscript(i : Int) -> itemType { get }
}


struct Stack<Element> : Container {
    var items = [Element].init()
    mutating func push (_ item : Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    //协议实现
    typealias itemType = Element
    var count: Int {
        return items.count
    }
    mutating func appending(_ item: Element) {
        self.push(item)
    }
    subscript (i : Int) -> Element {
        return items[i]
    }
}

//具有where字句的扩展
extension Stack where Element : Equatable {
    func isTop(_ item : Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

//你可以使用泛型 where 子句去扩展一个协议
//itemType 为 关联类型
extension Container where itemType : Equatable {
    func startWith(_ item : itemType) -> Bool {
        return count >= 1 && self[0] == item
    }
}

//一个泛型 where 子句去要求 Item 为特定类型
extension Container where itemType == Double {
    
}




class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        

        
        
        
    }
    
    //泛型
    func generics() {
        
        func swapTwoValue(_ a: inout Int,_ b: inout Int) {
            let temp = a
            a = b
            b = temp
        }
        
        func swapValue<T>(_ a: inout T,_ b: inout T) {
            let temp = a
            a = b
            b = temp
        }
        
        var firstName = "lll"
        var lastName = "ppp"
        swapValue(&firstName, &lastName)
        print(firstName,lastName)
        
        
        //类型参数   <T>
        
        
        //命名类型参数
        //请始终使用大写字母开头的驼峰命名法（例如 T 和 MyTypeParameter）来为类型参数命名，以表明它们是占位类型，而不是一个值。
        //在大多数情况下，类型参数具有一个描述性名字，例如 Dictionary<Key, Value> 中的 Key 和 Value，以及 Array<Element> 中的 Element，这可以告诉阅读代码的人这些类型参数和泛型函数之间的关系。然而，当它们之间没有有意义的关系时，通常使用单个字母来命名，例如 T、U、V，正如上面演示的 swapTwoValues(_:_:) 函数中的 T 一样。
        
        //泛型类型
        struct intType {
            var items = [Int].init()
            mutating func push(_ a : Int) {
                items.append(a)
            }
            mutating func pop () -> Int {
                return items.removeLast()
            }
        }
        
        //泛型版本
        //Element为待提供的类型提供了一个占位符，只是用站位类型 Element 代替了真实类型Int，
        //Element 在如下三个地方被用作占位符：
        //创建 items 属性，使用 Element 类型的空数组对其进行初始化。
        //指定 push(_:) 方法的唯一参数 item 的类型必须是 Element 类型。
        //指定 pop() 方法的返回值类型必须是 Element 类型。
        
        var stringType = Type<String>.init()
        stringType.push("33")
        stringType.push("44")
        stringType.pop()
        print(stringType.items)
        
        
        //扩展一个泛型类型
        //扩展泛型的时候，泛型原始类型中的属性列表可以直接使用
        
        
        //类型约束
        //类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
        //Swift 的 Dictionary 类型对字典的键的类型做了些限制。在字典的描述中，字典的键的类型必须是可哈希（hashable）的。也就是说，必须有一种方法能够唯一地表示它。Dictionary 的键之所以要是可哈希的，是为了便于检查字典是否已经包含某个特定键的值。若没有这个要求，Dictionary 将无法判断是否可以插入或者替换某个指定键的值，也不能查找到已经存储在字典中的指定键的值。
        
        //        func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
        //            // 这里是泛型函数的函数体部分
        //        }
        
        //这里有个名为 findIndex(ofString:in:) 的非泛型函数，该函数的功能是在一个 String 数组中查找给定 String 值的索引。若查找到匹配的字符串，findIndex(ofString:in:) 函数返回该字符串在数组中的索引值，否则返回 nil：
        func findIndex(aString : String,in array: [String]) -> Int? {
            for (index,value) in array.enumerated() {
                if value == aString {
                    return index
                }
            }
            return nil
        }
        
        
        let index = findIndex(aString: "hh", in: ["hh","pp","ll"])
        if let ind = index {
            print(ind)
        }
        // 如果只能查找字符串在数组中的索引，用处不是很大。不过，你可以用占位类型 T 替换 String 类型来写出具有相同功能的泛型函数 findIndex(_:_:)。
        
        func findValue<T : Equatable>(valueToFind : T, in array : [T]) -> Int? {
            for (index,value) in array.enumerated() {
                if value == valueToFind {
                    return index
                }
            }
            return nil
        }
        
        let aa = findValue(valueToFind: 9, in: [1,2,3,8,9,89])
        if let b = aa {
            print(b)
        }
        
        
        //关联类型
        //定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定。你可以通过 associatedtype 关键字来指定关联类型。
        struct IntStack : Container {
            var items = [Int].init()
            mutating func push (_ item : Int) {
                items.append(item)
            }
            mutating func pop() -> Int {
                return items.removeLast()
            }
            
            //Container 实现部分
            typealias itemType = Int //这行代码可以省略
            mutating func appending(_ item: Int) {
                self.push(item)
            }
            subscript(i : Int) -> Int {
                return items[i]
            }
            var count: Int {
                return items.count
            }
        }
        
        //结构体泛型
        struct Stack<Element> : Container {
            var items = [Element].init()
            mutating func push (_ item : Element) {
                items.append(item)
            }
            mutating func pop() -> Element {
                return items.removeLast()
            }
            
            //协议实现
            typealias itemType = Element
            var count: Int {
                return items.count
            }
            mutating func appending(_ item: Element) {
                self.push(item)
            }
            subscript (i : Int) -> Element {
                return items[i]
            }
        }
        
        
        //通过扩展一个存在的类型来制定关联类型
        
        
        
        //泛型where语句
        
        
        var stack = Stack<String>.init()
        stack.push("aa")
        stack.push("bb")
        stack.push("cc")
        
        //具有泛型 where 字句的扩展

    }
    
    ///协议
    func testProtocol () {
        //协议
        //类、结构体或枚举都可以遵循协议
        //可以对协议进行扩展
        
        //协议语法
        //协议的定义方式与类、结构体和枚举的定义非常相似：
        //        protocol SomeProtocol {
        //            // 这里是协议的定义部分
        //        }
        
        //        struct SomeStructure: FirstProtocol, AnotherProtocol {
        //            // 这里是结构体的定义部分
        //        }
        
        //        拥有父类的类在遵循协议时，应该将父类名放在协议名之前，以逗号分隔
        //        class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
        //            // 这里是类的定义部分
        //        }
        
        
        //属性要求
        //        协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型。此外，协议还指定属性是可读的还是可读可写的
        //        协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示：
        //        protocol SomeProtocol {
        //            var mustBeSettable: Int { get set }
        //            var doesNotNeedToBeSettable: Int { get }
        //        }
        
        //        在协议中定义类型属性时，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性：
        //        protocol AnotherProtocol {
        //            static var someTypeProperty: Int { get set }
        //        }
        
        
        struct Person : FullyNamed {
            var fullName: String
        }
        
        //Starship 类把 fullName 属性实现为只读的计算型属性。每一个 Starship 类的实例都有一个名为 name 的非可选属性和一个名为 prefix 的可选属性。 当 prefix 存在时，计算型属性 fullName 会将 prefix 插入到 name 之前，从而为星际飞船构建一个全名。
        class StarShip : FullyNamed {
            var prefix : String
            var name : String
            init(name : String,prefix : String? = nil) {
                self.name = name
                self.prefix = prefix!
            }
            var fullName: String {
                return (prefix != nil ? prefix + "" : "") + name
            }
        }
        
        //方法要求
        //协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。
        //正如属性要求中所述，在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字作为前缀：
        
        
        
        //Mutating 方法要求
        //有时需要在方法中改变方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。这一过程在在实例方法中修改值类型章节中有详细描述。
        
        //如果你在协议中定义了一个实例方法，该方法会改变遵循该协议的类型的实例，那么在定义协议时需要在方法前加 mutating 关键字。这使得结构体和枚举能够遵循此协议并满足此方法要求。
        
        //实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字
        
        enum OnOffSwitch : Togglable {
            case on,off
            mutating func toggle() {
                switch self {
                case .on:
                    self = .off
                case.off:
                    self = .on
                }
            }
        }
        
        var light = OnOffSwitch.off
        light.toggle()
        
        
        //构造器要求
        //协议可以要求遵循协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：
        //你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。无论哪种情况，你都必须为构造器实现标上 required 修饰符：
        //使用 required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。
        //如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符，因为 final 类不能有子类。关于 final 修饰符的更多内容，请参见防止重写。在类前边 加上 final 关键字，表明类不能被继承
        class Zero : GeneratorProtocol {
            var name : String
            required init(name: String) {
                self.name = name
            }
        }
        
        //如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现要同事标注 required 和 override 修饰符
        
        class People {
            init() {
            }
        }
        
        class Man : People ,PeopleProtocol {
            // 因为遵循协议，需要加上 required
            // 因为继承自父类，需要加上 override
            required override init() {
                
            }
        }
        
        
        //可失败构造器要求
        //协议还可以为遵循协议的类型定义可失败构造器要求，详见可失败构造器。
        //遵循协议的类型可以通过可失败构造器（init?）或非可失败构造器（init）来满足协议中定义的可失败构造器要求。协议中定义的非可失败构造器要求可以通过非可失败构造器（init）或隐式解包可失败构造器（init!）来满足。
        
        
        
        //协议作为类型
        //尽管协议本身并未实现任何功能，但是协议可以被当做一个成熟的类型类使用
        /*
         协议可以像其他普通类型一样使用，使用场景如下：
         作为函数、方法或构造器中的参数类型或返回值类型
         作为常量、变量或属性的类型
         作为数组、字典或其他容器中的元素类型
         
         协议是一种类型，因此协议类型的名称应与其他类型（例如 Int，Double，String）的写法相同，使用大写字母开头的驼峰式写法，例如（FullyNamed 和 RandomNumberGenerator）。
         
         */
        
        
        //委托模式
        //委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。委托模式的实现很简单：定义协议来封装那些需要被委托的功能，这样就能确保遵循协议的类型能提供这些功能。委托模式可以用来响应特定的动作，或者接收外部数据源提供的数据，而无需关心外部数据源的类型。
        
        
        let tracker = DiceGameTracker.init()
        let game = SnakesAndLadders.init()
        game.delegate = tracker
        game.play()
        
        
        //类类型专属协议   通过添加 class 关键字来限制协议只能被类类型遵循，而结构体或枚举不能遵循该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：
        
        //协议类型集合
        //协议类型可以在数组或者字典这样的集合中使用，在协议类型提到了这样的用法。下面的例子创建了一个元素类型为 TextRepresentable 的数组：
        
        let bbb = BBB.init()
        let ccc = CCC.init()
        let ddd = DDD.init()
        let groups : [GroupProtocol] = [bbb,ccc,ddd]
        for thing in groups {
            thing.test()
        }


    }
    
    
    ///  错误处理
    func test15() {
        //错误处理
        enum VendingMachineError : Error {
            case invalidSelection
            case insufficientFunds(coinsNeed : Int)
            case outOfStock
        }
        //抛出一个错误可以让你表明有意外情况发生，导致正常的执行流程无法继续执行。抛出错误使用throw关键字。例如，下面的代码抛出一个错误，提示贩卖机还需要5个硬币：
        
        //        throw VendingMachineError.insufficientFunds(coinsNeed: 5)
        
        //用 throwing 函数传递错误
        //为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型，throws关键词需要写在箭头（->）的前面。
        
        
        //用 throws 函数传递错误
        //为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型，throws关键词需要写在箭头（->）的前面。
        //        func canThrowError () throws -> String {}
        //        func canThrows () throws {}
        
        struct Item {
            var price : Int
            var count : Int
        }
        class VendingMachine {
            var inventory = [
                "a" : Item(price : 12,count : 4),
                "b": Item(price : 13,count : 5),
                "c" : Item(price : 15,count : 6)
            ]
            var coinsDeposited = 0
            func dispenseSnack(snack : String) {
                print("dispence \(snack)")
            }
            
            func vend(itemNamed name : String) throws {
                guard let item = inventory[name] else { //没有这个item项
                    throw VendingMachineError.invalidSelection
                }
                guard item.count > 0 else { //存货不够
                    throw VendingMachineError.outOfStock
                }
                guard item.price <= coinsDeposited else { //钱不够
                    throw VendingMachineError.insufficientFunds(coinsNeed: item.price - coinsDeposited)
                }
                
                coinsDeposited -= item.price
                
                var newItem = item
                newItem.count -= 1
                inventory[name] = newItem
                print("dispensing \(name)")
            }
        }
        
        //在vend(itemNamed:)方法的实现中使用了guard语句来提前退出方法，确保在购买某个物品所需的条件中，有任一条件不满足时，能提前退出方法并抛出相应的错误。由于throw语句会立即退出方法，所以物品只有在所有条件都满足时才会被售出。
        
        //因为vend(itemNamed:)方法会传递出它抛出的任何错误，在你的代码中调用此方法的地方，必须要么直接处理这些错误——使用do-catch语句，try?或try!；要么继续将这些错误传递下去。例如下面例子中，buyFavoriteSnack(_:vendingMachine:)同样是一个 throwing 函数，任何由vend(itemNamed:)方法抛出的错误会一直被传递到buyFavoriteSnack(person:vendingMachine:)函数被调用的地方。
        
        let favouriteItem = [
            "xiaohong":"a",
            "xiaoming":"b",
            "xiaogang":"c"
        ]
        
        func buyFavouriteSnack(person : String,vendingMachine : VendingMachine) throws {
            let snackName = favouriteItem[person] ?? "xiaoyun"
            try vendingMachine.vend(itemNamed: snackName)
        }
        
        //用 Do-Catch 处理错误
        //可以使用一个do-catch语句运行一段闭包代码来处理错误。如果在do子句中的代码抛出了一个错误，这个错误会与catch子句做匹配，从而决定哪条子句能处理它。
        //        do {
        //            try expression
        //            statements
        //        } catch pattern 1 {
        //            statements
        //        } catch pattern 2 where condition {
        //            statements
        //        } catch {
        //            statements
        //        }
        
        //在catch后面写一个匹配模式来表明这个子句能处理什么样的错误。如果一条catch子句没有指定匹配模式，那么这条子句可以匹配任何错误，并且把错误绑定到一个名字为error的局部常量。关于模式匹配的更多信息请参考 模式。
        
        //catch子句不必将do子句中的代码所抛出的每一个可能的错误都作处理。如果所有catch子句都未处理错误，错误就会传递到周围的作用域。然而，错误还是必须要被某个周围的作用域处理的——要么是一个外围的do-catch错误处理语句，要么是一个 throwing 函数的内部。举例来说，下面的代码处理了VendingMachineError枚举类型的全部枚举值，但是所有其它的错误就必须由它周围的作用域处理：
        
        let vendingMachine = VendingMachine.init()
        vendingMachine.coinsDeposited = 20
        do {
            try buyFavouriteSnack(person: "xiaoming", vendingMachine: vendingMachine)
            print("买到啦")
        } catch VendingMachineError.invalidSelection {
            print("invalid selection")
        } catch VendingMachineError.insufficientFunds(coinsNeed: let coinsNeed) {
            print("need coins \(coinsNeed)")
        } catch VendingMachineError.outOfStock {
            print("no have stock")
        } catch { //加个空的catch ，不然会报错 Errors thrown from here are not handled because the enclosing catch is not exhaustive
            
        }
        
        //将错误转换成可选值
        //可以使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil。例如,在下面的代码中,x和y有着相同的数值和等价的含义：
        
        //如果你想对所有的错误都采用同样的方式来处理，用try?就可以让你写出简洁的错误处理代码。例如，下面的代码用几种方式来获取数据，如果所有方式都失败了则返回nil：
        
        
        
        //禁用错误传递
        
        
        //指定清理工作
        //可以使用defer语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，还是由于诸如return或者break的语句。例如，你可以用defer语句来确保文件描述符得以关闭，以及手动分配的内存得以释放。
        
        //defer语句将代码的执行延迟到当前的作用域退出之前。该语句由defer关键字和要被延迟执行的语句组成。延迟执行的语句不能包含任何控制转移语句，例如break或是return语句，或是抛出一个错误。延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条defer语句中的代码会在第二条defer语句中的代码被执行之后才执行，以此类推。
        
        //        func processFile(filename: String) throws {
        //            if exists(filename) {
        //                let file = open(filename)
        //                defer {
        //                    close(file)
        //                }
        //                while let line = try file.readline() {
        //                    // 处理文件。
        //                }
        //                // close(file) 会在这里被调用，即作用域的最后。
        //            }
        //        }
        

    }
    
    /// 类型转换
    func test14() {
        //类型转换
        //类型转换 可以判断实例的类型，也可以将实例看做是其父类或者子类的实例。
        //类型转换在 Swift 中使用 is 和 as 操作符实现。这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型。
        
        class Library {
            let name : String
            init(name : String) {
                self.name = name
            }
        }
        
        class Movie : Library {
            var director : String
            init(name: String,director : String) {
                self.director = director
                super.init(name: name)
            }
        }
        
        class Song : Library {
            var artist : String
            init(name : String,artist : String) {
                self.artist = artist
                super.init(name: name)
            }
        }
        
        let group = [
            Movie.init(name: "a", director: "AA"),
            Movie.init(name: "b", director: "BB"),
            Song.init(name: "c", artist: "CC"),
            Song.init(name: "d", artist: "DD"),
            ]
        //类型检查，用 类型检查操作符（is）来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true，否则返回 false。<# is 是检查 子类是不是 ，某类的 特定子类型 类似于isKindOfClass#>
        var songCount = 0,movieCount = 0
        for item in group {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }
        
        //向下转型
        //某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类型，用类型转换操作符（as? 或 as!）。as? as!
        
        /*
         因为向下转型可能会失败，类型转型操作符带有两种不同形式。条件形式as? 返回一个你试图向下转成的类型的可选值。强制形式 as! 把试图向下转型和强制解包（转换结果结合为一个操作。
         
         当你不确定向下转型可以成功时，用类型转换的条件形式（as?）。条件形式的类型转换总是返回一个可选值，并且若下转是不可能的，可选值将是 nil。这使你能够检查向下转型是否成功。
         
         只有你可以确定向下转型一定会成功时，才使用强制形式（as!）。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。
         
         下面的例子，迭代了 library 里的每一个 MediaItem，并打印出适当的描述。要这样做，item 需要真正作为 Movie 或 Song 的类型来使用，而不仅仅是作为 MediaItem。为了能够在描述中使用 Movie 或 Song 的 director 或 artist 属性，这是必要的。
         
         在这个示例中，数组中的每一个 item 可能是 Movie 或 Song。事前你不知道每个 item 的真实类型，所以这里使用条件形式的类型转换（as?）去检查循环里的每次下转：
         */
        
        
        for item in group {
            if let movie = item as? Movie { //返回的是可选值，可能是？Movie，？Song 所以使用可选绑定
                print("movie name = \(movie.name)   director = \(movie.director)")
            } else if let song = item as? Song {
                print("song name = \(song.name) artist = \(song.artist)")
            }
        }
        
        
        //Any AnyObject 的类型转换
        //Swift 为不确定类型提供了两种特殊的类型别名
        //Any 可以表示任何类型，包括函数类型。
        //AnyObject 可以表示任何类类型的实例。
        
        var things = [Any].init()
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.13)
        things.append("hello world")
        things.append((3,5))
        things.append(Movie.init(name: "pp", director: "kk"))
        things.append({(name : String) -> String in "hello \(name)" })
        things.append((404,"badnet"))
        
        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero int")
            case 0 as Double:
                print("zero double")
            case let someInt as Int:
                print(someInt)
            case is Double:
                print("double    \(thing)")
            case let someString as String:
                print(someString)
            case let (x,y) as (Int,String):
                print("tuple is \(x)   \(y)")
            case let movie as Movie:
                print(movie.name,movie.director)
            case let stringConverter as (String) -> String:
                print(stringConverter("haha"))
            default:
                print("other")
            }
        }
    }
    
    //可选链
    func test13 () {
        /*
         1、使用可选链式调用代替强制展开
         2、为可选链式调用定义模型类
         3、通过可选链式调用访问属性
         4、通过链式调用调用方法
         5、通过链式调用 访问下标
         6、连接多层可选链式调用
         7、在方法的可选返回值上进行可选链式调用
         */
        
        //可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。
        
        //1、使用可选链是调用代替强制展开
        //可用链式调用？和强制展开！的区别是：？调用只会失败并不会发生运行时错误，但是！如果可选没有值，就会发生运行时错误；
        //可选链式调用 返回值 为可选值；
        //        class Person {
        //            var residence : Residence?
        //        }
        //        class Residence {
        //            var numberOfRooms = 1
        //        }
        //
        //        let john = Person.init()
        //        let residence = Residence.init()
        //        john.residence = residence
        ////        let roomCount = john.residence!.numberOfRooms //如果residence没有值，会发生运行时错误
        //
        //        //下边写法  可选链式调用提供了另一种访问numberOfRooms的方式，使用问号（?）来替代原来的叹号（!）
        //        if let number = john.residence?.numberOfRooms {
        //            print("roomCount = \(number)")
        //        } else {
        //            print("nil")
        //        }
        
        
        //为可选链式调用定义模型类
        //通过使用可选链式调用可以调用多层属性、方法和下标。这样可以在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法或下标。
        
        class Room {
            let name : String
            init(name : String) {
                self.name = name
            }
        }
        
        class Address {
            var buildName : String?
            var buildNumber : String?
            var street : String?
            func buildIdentifier () -> String? {
                if buildName != nil {
                    return buildName
                } else if buildNumber != nil && street != nil {
                    return "\(buildNumber!)   \(street!)"
                } else {
                    return nil
                }
            }
        }
        
        class Person {
            var residence : Residence?
        }
        
        class Residence {
            var rooms = [Room].init()
            var numberOfRooms : Int {
                return rooms.count
            }
            subscript(i : Int) -> Room {
                get {
                    return rooms[i]
                }
                set {
                    rooms[i] = newValue
                }
            }
            
            func printNumberOfRooms () {
                print("number of rooms is \(numberOfRooms)")
            }
            var address : Address?
        }
        
        let john = Person.init()
        if let roomCount = john.residence?.numberOfRooms {
            print("rooms have \(roomCount)")
        } else {
            print("no have ")
        }
        
        let residence = Residence.init()
        john.residence = residence
        let address = Address.init()
        address.buildNumber = "90"
        address.buildName = "ppp"
        address.street = "45 street"
        john.residence?.address = address
        if let name = john.residence?.address?.buildName {
            print("build name = \(name)")
        } else {
            print("build name = nil")
        }
        
        //通过判断函数的返回值是否为 nil 来判断 调用是否成功
        if john.residence?.printNumberOfRooms() != nil {
            print("create success")
        } else {
            print("create false")
        }
        
        //这个方法没有返回值。然而，没有返回值的方法具有隐式的返回类型Void，如无返回值函数中所述。这意味着没有返回值的方法也会返回()，或者说空的元组。
        //如果在可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是Void?，而不是Void，因为通过可选链式调用得到的返回值都是可选的。这样我们就可以使用if语句来判断能否成功调用printNumberOfRooms()方法，即使方法本身没有定义返回值。通过判断返回值是否为nil可以判断调用是否成功：
        
        //访问下标
        //通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面。
        //问号直接放在john.residence的后面，并且在方括号的前面，因为john.residence是可选值。
        //类似的，可以通过下标，用可选链式调用来赋值：
        
        //        john.residence?[0] = Room.init(name: "FIRST")
        //        let johnHouse = Residence.init()
        residence.rooms.append(Room.init(name: "111"))
        residence.rooms.append(Room.init(name: "222"))
        residence.rooms.append(Room.init(name: "333"))
        residence.rooms.append(Room.init(name: "444"))
        
        if let firstRoomName = john.residence?[0].name {
            print("the first room name is \(firstRoomName)")
        } else {
            print("the first room name is nil")
        }
        
        if let roomName = john.residence?[0].name {
            print("name = \(roomName)")
        } else {
            print("name = nil")
        }
        
        
        //访问可选类型的下标
        //如果下标返回可选类型值，比如 Swift 中Dictionary类型的键的下标，可以在下标的结尾括号后面放一个问号来在其可选返回值上进行可选链式调用：
        //        var testDic : Dictionary = ["first":[2,3,4,56],"sec":[65,78,6]]
        //        testDic["sec"]?[1] = 888
        //        print(testDic["sec"]?[1])
        
        
        //连接多层可选链式调用
        //如果你访问的值不是可选的，可选链式调用将会返回可选值。
        //如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选”。
        //通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
        //类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。
        
        if let streetName = john.residence?.address?.street {
            print("street name = \(streetName)")
        } else {
            print("street name = nil")
        }
        
        
        //在方法的可选返回值上进行可选链式调用
        
        if let identifier = john.residence?.address?.buildIdentifier() {
            print("identifier = \(identifier)")
        } else {
            print("identifier = nil")
        }
        
        
        if let beginWith = john.residence?.address?.buildIdentifier()?.hasPrefix("p") {
            if beginWith {
                print("YES")
            } else {
                print("NO")
            }
        }
        //在上面的例子中，在方法的圆括号后面加上问号是因为你要在buildingIdentifier()方法的可选返回值上进行可选链式调用，而不是方法本身。
        
        

    }
    
    
    ///  嵌套类型
    func test12() {
 
        let li = A.init()
        li.firstName = "li"
        li.appenName(last: " ming")
        
        let black = BlackjackCard.init(rank: .Jack, suit: .Hearts)
        print(black.description)
        //引用嵌套类型
        print(black.suit.rawValue)
        print(black.rank.values.first)
        print(BlackjackCard.Suit.Diamonds.rawValue)

    }
    
    //enumerate
    func testEnum() {
        //枚举
        var move = MoveMent.Left
        //switch 使用
        switch move {
        case .Left:
            print("left")
            //        default:
            //            print("none")
        }
        //判断使用
        move = .Down
        if move == .Left {
            print("left")
        }
        
        //明确case 使用
        if case .Left = move {
            print("left")
        }
        
        //使用默认构造方法来初始化
        let moveMent = Movement.init(rawValue: 3)
        print(moveMent!)
        
        
        let code = Barcode.qr("haha")
        var code1 = Barcode.qr("ll")
        code1 = .qr("kk")
        print(code,code1)
        
        
        //枚举类型的 原始值的隐式赋值
        //，Plant.mercury的显式原始值为1，Planet.venus的隐式原始值为2，依次类推。
        //当原始类型为字符串时，每个枚举成员的隐式原始值为该枚举成员的名称
        //使用 rawValue 可以访问成员的原始值
        var direct = Direct.east
        direct = .west
        print(direct)
        print(direct.rawValue)
        print(Direct.east.rawValue)
        //        let dd = Direct.init(rawValue: "weat")
        //        print(dd ?? "")
        //        print(dd!.rawValue)
        
        //递归枚举
        //递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值
        
        
        func evaluate (_ expression : Expression) -> Int {
            switch expression {
            case let .number(value):
                return value
            case let .add(left,right) :
                return evaluate(left) + evaluate(right)
            case let .multiply(left,right) :
                return evaluate(left) * evaluate(right)
            }
        }
        let number1 = Expression.number(4)
        let number2 = Expression.number(5)
        let add = Expression.add(number1, number2)
        let multiply = Expression.multiply(number2, number1)
        print(evaluate(multiply))
        print(evaluate(add))

    }
    
    
    //扩展
    func test11 () {
        
        
        /*
         使用关键字 extension 来声明扩展：
         
         extension SomeType {
         // 为 SomeType 添加的新功能写到这里
         }
         
         
         可以通过扩展来扩展一个已有类型，使其采纳一个或多个协议。在这种情况下，无论是类还是结构体，协议名字的书写方式完全一样：
         
         extension SomeType: SomeProtocol, AnotherProctocol {
         // 协议实现写到这里
         }
         
         */
        
        //计算型属性
        //扩展可以为已有的类型添加计算型实例属性 和 计算型类型属性
        
        let oneInch = 25.4.mm
        print("one inch is \(oneInch) meters")
        
        //扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
        
        //添加构造器
        
        //添加实例方法 类型方法
        
        3.repeatCount {
            print("hello world !")
        }
        
        //可变实例方法
        //通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样。
        var count = 3
        print(count.square())
        
        //下标
        //扩展可以为已有类型添加新下标
        
        
    
        //扩展
        /*
         添加计算型属性和计算型类型属性
         定义实例方法和类型方法
         提供新的构造器
         定义下标
         定义和使用新的嵌套类型
         使一个已有类型符合某个协议
         
         扩展可以为一个类型增加新的功能，但是不能重写已有功能
         
         扩展可以为已有类型添加新的实例方法和类型方法。
         
         通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样。
         
         */
        
        //计算型属性 扩展可以为已有类型添加计算型实例属性 和 计算型类型数形
        
        
        let a = "haha"
        a.description()
        
        //嵌套类型  扩展可以为已有的类 结构体 枚举 添加新的嵌套类型
        
        let arrayInt = [1,2,3,-4,0]
        for a in arrayInt {
            switch a.kind {
            case .Negative:
                print("-")
            case .Positive:
                print("+")
            default:
                print("0")
            }
        }
        
        //下标
        //扩展可以为已有类型添加新下标

    }
    
    
    //自动引用计数
    func test10 () {
        
        class Person {
            let name : String
            init(name : String) {
                self.name = name
                print("\(name) is initial")
            }
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        
        var person = Person.init(name: "xiao")
        var reference1 : Person?
        var reference2 : Person?
        var reference3 : Person?
        reference1 = person
        reference2 = reference1
        reference3 = reference1
        
        
        reference2 = nil
        reference3 = nil
        reference1 = nil
        
        
        //        class Person {
        //            let name: String
        //            init(name: String) { self.name = name }
        //            var apartment: Apartment?
        //            deinit { print("\(name) is being deinitialized") }
        //        }
        //
        //        class Apartment {
        //            let unit: String
        //            init(unit: String) { self.unit = unit }
        //            weak var tenant: Person?   weak弱引用
        //            deinit { print("Apartment \(unit) is being deinitialized") }
        //        }
        
        //弱引用
        // 弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用。
        
        //因为弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁。因此，ARC 会在引用的实例被销毁后自动将其赋值为nil。并且因为弱引用可以允许它们的值在运行时被赋值为nil，所以它们会被定义为可选类型变量，而不是常量。
        
        //你可以像其他可选值一样，检查弱引用的值是否存在，你将永远不会访问已销毁的实例的引用。
        
        
        
        
        
        //无主引用
        
        //Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。
        //Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。
        
        
        //无主引用以及隐式解析可选属性
        

    }
    
    
    //析构过程
    func test9() {
        //析构过程
        //析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字deinit来标示，类似于构造器要用init来标示。
        
        // 析构过程原理
        //Swift 会自动释放不再需要的实例以释放资源。如自动引用计数章节中所讲述，Swift 通过自动引用计数（ARC）处理实例的内存管理。通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前手动去关闭该文件。
        
        //在类的定义中，每个类最多只能有一个析构器，而且析构器不带任何参数，如下所示：
        //        deinit {
        //
        //        }
        
        
        class Bank {
            static var coinsInBank = 10000
            static func distribute(coins numberCoinsRequired : Int) -> Int {
                let numberOfCoin = min(numberCoinsRequired, coinsInBank)
                coinsInBank -= numberOfCoin
                return numberOfCoin
            }
            static func receive (coins : Int) {
                coinsInBank += coins
            }
        }
        
        class Player {
            var coinsInPurse : Int
            init(coins : Int) {
                coinsInPurse = Bank.distribute(coins: coins)
            }
            func win(coins : Int) {
                coinsInPurse += Bank.distribute(coins: coins)
            }
            deinit { //对象时放就会调用 类似于OC中的 dealloc
                Bank.receive(coins: coinsInPurse)
            }
        }
        
        var playerOne : Player? = Player.init(coins: 100)
        print("a new player has joined the game with \(playerOne!.coinsInPurse) coins") //因为playerOne是可选的，所以访问其coinsInPurse属性来打印钱包中的硬币数量时，使用感叹号（!）来解包：
        playerOne?.win(coins: 1000)
        playerOne!.win(coins: 1000)
        print("------- \(playerOne!.coinsInPurse)")
        
        
        playerOne = nil
        print(" ------ bank.coins = \(Bank.coinsInBank)")
        
    }
    
    
    //构造器
    func test8() {
        //构造器 init关键字
        //Swift 的构造器无需返回值
        //类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值 存储型属性的值不能处于一个未知的状态。
        //可以在构造器中为存储型属性赋初值，也可以在定义属性时为其设置默认值
        //当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者。
        
        //        init () {
        //            //处理构造过程
        //        }
        struct Fahrenheit {
            var temperature : Double
            init() {
                temperature = 32.0
            }
        }
        let f = Fahrenheit()
        print(f.temperature)
        
        //默认属性值
        //如前所述，你可以在构造器中为存储型属性设置初始值。同样，你也可以在属性声明时为其设置默认值。
        //如果一个属性总是使用相同的初始值，那么为其设置一个默认值比每次都在构造器中赋值要好。两种方法的效果是一样的，只不过使用默认值让属性的初始化和声明结合得更紧密。使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型；同时，它也能让你充分利用默认构造器、构造器继承等特性，后续章节将讲到。
        
        //自定义构造过程
        
        
        //构造参数
        struct Celsius {
            var temperatureInCelsius : Double
            init(fromFahrenheit fahrenheit : Double) {
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin : Double) {
                temperatureInCelsius = kelvin - 273.15
            }
        }
        
        let celsius = Celsius.init(fromFahrenheit: 32.0)
        print(celsius.temperatureInCelsius)
        //        let celsius1 = Celsius()
        //        print(celsius.temperatureInCelsius)
        
        struct People {
            var age : Int
            var name : String
            init(name : String,age : Int) {
                self.name = name
                self.age = age
            }
        }
        let people = People(name: "haha",age : 19)
        print(people.name,people.age)
        
        //参数的内部名称 和 外部名称
        //跟函数和方法参数相同，构造参数也拥有一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。
        //然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。因此在调用构造器时，主要通过构造器中的参数名和类型来确定应该被调用的构造器。正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名字，Swift 会为构造器的每个参数自动生成一个跟内部名字相同的外部名。
        
        struct Color {
            let green,red,white : Double
            init(green : Double,red : Double,white : Double) {
                self.red = red
                self.white = white
                self.green = green
            }
            //            init(all : Double) {
            //                self.red = all
            //                self.white = all
            //                self.green = all
            //            }
            init(_ all : Double) {
                red = all
                green = all
                white = all
            }
        }
        //注意，如果不通过外部参数名字传值，你是没法调用这个构造器的。只要构造器定义了某个外部参数名，你就必须使用它，忽略它将导致编译错误：
        
        
        //不带外部名的构造器参数
        //如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线(_)来显式描述它的外部名，以此重写上面所说的默认行为
        //        let color = Color(23.0)
        
        //可选属性类型
        class ServeyQuestion {
            var text : String
            var response : String?
            init(text : String) {
                self.text = text
            }
            func ask() -> Void {
                print(text)
            }
        }
        
        let question = ServeyQuestion.init(text: "have a question")
        //        let q = ServeyQuestion(text: "ll")
        question.ask()
        print(question.response ?? "可选默认值")
        
        
        //构造过程中常量的修改
        //你可以在构造过程中的任意时间点给常量属性指定一个值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。
        //注意
        //对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
        //你可以修改上面的SurveyQuestion示例，用常量属性替代变量属性text，表示问题内容text在SurveyQuestion的实例被创建之后不会再被修改。尽管text属性现在是常量，我们仍然可以在类的构造器中设置它的值
        
        //默认构造器
        class ShoppingListItem {
            var name : String?
            var price : Double?
            var quantity = 1
        }
        let shoppingListItem = ShoppingListItem()//默认构造器
        //由于ShoppingListItem类中的所有属性都有默认值，且它是没有父类的基类，它将自动获得一个可以为所有属性设置默认值的默认构造器（尽管代码中没有显式为name属性设置默认值，但由于name是可选字符串类型，它将默认设置为nil）。上面例子中使用默认构造器创造了一个ShoppingListItem类的实例（使用ShoppingListItem()形式的构造器语法），并将其赋值给变量item
        print(shoppingListItem.name ?? "no name",shoppingListItem.price ?? "250",shoppingListItem.quantity)
        
        
        
        //结构体的逐一成员构造器
        //除了上面提到的默认构造器，如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。
        struct Size {
            var width : Double = 0.0
            var height : Double = 0.0
        }
        let size = Size(width : 90,height : 90)
        print(size.width,size.height)
        var size1 = Size()
        size1.width = 80.0
        size1.height = 80.0
        print(size1)
        
        
        //值类型的构造器代理
        //对于值类型，你可以使用self.init在自定义的构造器中引用相同类型中的其它构造器。并且你只能在构造器内部调用self.init。
        //如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）。这种限制可以防止你为值类型增加了一个额外的且十分复杂的构造器之后,仍然有人错误的使用自动生成的构造器
        //注意
        //假如你希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展（extension）中，而不是写在值类型的原始定义中。想查看更多内容，请查看扩展章节。
        struct Size2 {
            var width = 0.0
            var height = 0.0
        }
        struct Point {
            var x = 0.0
            var y = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size2()
            init() {}
            init(origin : Point,size : Size2) {
                self.origin = origin
                self.size = size
            }
            init(center : Point,size : Size2) {
                let originX = center.x - (size.width/2)
                let originY = center.y -    size.height/2
                self.init(origin: Point(x : originX,y : originY), size: size)
            }
        }
        
        let rect1 = Rect.init()
        //第一个Rect构造器init()，在功能上跟没有自定义构造器时自动获得的默认构造器是一样的。这个构造器是一个空函数，使用一对大括号{}来表示，它没有执行任何构造过程。调用这个构造器将返回一个Rect实例，它的origin和size属性都使用定义时的默认值Point(x: 0.0, y: 0.0)和Size(width: 0.0, height: 0.0)：
        
        let rect2 = Rect.init(origin: Point.init(x: 2.0, y: 2.0), size: Size2.init(width: 5.0, height: 5.0))
        //第二个Rect构造器init(origin:size:)，在功能上跟结构体在没有自定义构造器时获得的逐一成员构造器是一样的。这个构造器只是简单地将origin和size的参数值赋给对应的存储型属性
        
        let rect3 = Rect.init(center: Point.init(x: 6.0, y: 6.0), size: Size2.init(width: 5.0, height: 5.0))
        print("----\n\(rect1) -----\n\(rect2) --------\n\(rect3)")
        //第三个Rect构造器init(center:size:)稍微复杂一点。它先通过center和size的值计算出origin的坐标，然后再调用（或者说代理给）init(origin:size:)构造器来将新的origin和size值赋值到对应的属性中：
        
        
        
        
        
        
        //类的继承和构造过程
        //类里面的所有存储行属性，包括所有继承自父类的属性，都必须在构造过程中设置初始值
        
        /*
         
         指定构造器和便利构造器的语法
         
         类的指定构造器的写法跟值类型简单构造器一样：
         
         init(parameters) {
         
         }
         便利构造器也采用相同样式的写法，但需要在init关键字之前放置convenience关键字，并使用空格将它们俩分开：
         
         convenience init(parameters) {
         
         }
         
         
         类的构造器代理规则
         规则1：指定构造器必须调用其直接父类的指定构造器
         规则2：便利构造器必须调用同类中定义的其他构造器
         规则3：便利构造器必须最终导致一个指定构造器被调用
         
         记忆方法：
         1、指定构造器必须总是向上代理
         2、便利构造器必须总是横向代理
         
         */
        
        
        class Tree {
            var height : Double
            var age : Int
            init(_ height : Double,_ age : Int) { //指定构造器
                self.height = height
                self.age = age
            }
            
            convenience init(_ h : Double) { //便利构造器
                self.init(h, 3)
            }
            convenience init(_ a : Int) { //便利构造器
                //                self.init(10.0, 2)
                self.init(20.0)
                self.absorbSun()
                self.absorbWater()
            }
            
            final func absorbSun() -> Void { //子类不能重写
                print("吸收阳光")
            }
            func absorbWater() {
                print("吸收水分")
            }
        }
        //每一个类必须拥有至少一个指定构造器，在某种情况下，许多类通过继承父类的指定构造器而满足了这一条件，遍历构造器在类中是比较次要的辅助性构造器，便利构造器必须调用一个类中的指定构造器，并未参数提供默认值
        
        let tree = Tree.init(3.0, 3)
        print(tree.height,tree.age)
        
        class SmallTree : Tree {
            var weight = 10.0 //第一阶段
            //            override init(_ height: Double, _ age: Int) {
            //                super.init(height, age)
            //            }
            init(weight : Double) { //第二阶段
                super.init(20.0, 4)
                self.weight = weight
            }
            
            override func absorbWater() { //重写父类方法
                print("smallTree 吸收水分")
            }
            
        }
        
        let smallTree = SmallTree.init(weight: 30.8)
        smallTree.age = 40
        smallTree.height = 90.0
        smallTree.weight = 80.0
        smallTree.absorbWater()
        print("smallTree weight\(smallTree.weight)   height\(smallTree.height)   age\(smallTree.age)")
        //这些规则则不会影响类的实例如何创建，任何上图中展示的构造器都可以用来创建完全初始化的实例，这些规则只影响类定义如何实现；
        
        //两段式构造过程
        //Swift 中类的构造过程包含两个阶段。第一个阶段，每个存储型属性被引入它们的类指定一个初始值。当每个存储型属性的初始值被确定后，第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性。
        //两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器意外地赋予不同的值。
        //Swift 的两段式构造过程跟 Objective-C 中的构造过程类似。最主要的区别在于阶段 1，Objective-C 给每一个属性赋值0或空值（比如说0或nil）。Swift 的构造流程则更加灵活，它允许你设置定制的初始值，并自如应对某些属性不能以0或nil作为合法默认值的情况。
        /*
         swift编译器执行4种安全检查，以确保两段式构造过程正确的完成
         1、指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。
         如上所述，一个对象的内存只有在其所有存储型属性确定之后才能完全初始化。为了满足这一规则，指定构造器必须保证它所在类引入的属性在它往上代理之前先完成初始化。
         2、指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖。
         3、便利构造器必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。
         
         4、构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值。
         类实例在第一阶段结束以前并不是完全有效的。只有第一阶段完成后，该实例才会成为有效实例，才能访问属性和调用方法。
         
         阶段1：
         某个指定构造器或便利构造器被调用。
         完成新实例内存的分配，但此时内存还没有被初始化。
         指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化。
         指定构造器将调用父类的构造器，完成父类属性的初始化。
         这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部。
         当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段 1 完成
         
         阶段2：
         从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
         最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。
         
         */
        
        //构造器的继承和重写
        //跟 Objective-C 中的子类不同，Swift 中的子类默认情况下不会继承父类的构造器。Swift 的这种机制可以防止一个父类的简单构造器被一个更精细的子类继承，并被错误地用来创建子类的实例。
        //重写 父类的指定构造器 关键字 overide；重写便利构造器不需要加上关键字 override
        class HighTree : Tree {
            convenience init(_ h : Double) { //no have override
                self.init(3.0, 3)
            }
            override init(_ height: Double, _ age: Int) { //have override
                super.init(height, age)
                self.height = height + 10.0
                self.age = age + 1
            }
        }
        
        let highTree = HighTree.init(30.0)
        print(highTree.height,highTree.age)
        
        
        //构造器的自动继承
        //假如你为新引入的属性都提供了默认值；
        //规则1、如果子类没有定义任何指定构造器，那么它将自动继承所有父类的指定构造器
        //规则2、如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。
        
        class MediumTree : Tree {
            var branch = 10
        }
        let mediumTree = MediumTree.init(20.0, 3)
        print(mediumTree.age)
        
        //子类的便利构造器 可以 复写父类的指定构造器
        class Food {
            var name: String
            init(name: String) {
                self.name = name
            }
            convenience init() {
                self.init(name: "[Unnamed]")
            }
        }
        
        class RecipeIngredient: Food {
            var quantity: Int
            init(name: String, quantity: Int) {
                self.quantity = quantity
                super.init(name: name)
            }
            override convenience init(name: String) {
                self.init(name: name, quantity: 1)
            }
        }
        //RecipeIngredient的便利构造器init(name: String)使用了跟Food中指定构造器init(name: String)相同的参数。由于这个便利构造器重写了父类的指定构造器init(name: String)，因此必须在前面使用override修饰符
        
        
        
        //可失败构造器
        //如果一个类、结构体或枚举类型的对象，在构造过程中有可能失败，则为其定义一个可失败构造器。这里所指的“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。
        
        //为了妥善处理这种构造过程中可能会失败的情况。你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面添加问号(init?)。
        //<#可失败构造器的参数名和参数类型，不能与其它非可失败构造器的参数名，及其参数类型相同。#>
        
        //可失败构造器会创建一个类型为自身类型的可选类型的对象。你通过return nil语句来表明可失败构造器在何种情况下应该“失败”。
        
        //注意
        //严格来说，构造器都不支持返回值。因为构造器本身的作用，只是为了确保对象能被正确构造。因此你只是用return nil表明可失败构造器构造失败，而不要用关键字return来表明构造成功。
        struct Animal {
            let species : String
            init? (species : String) {
                if species.isEmpty {return nil }
                self.species = species
            }
            init(sp : String) {
                self.species = sp
            }
        }
        
        let animal = Animal.init(species: "monkey") //animal的类型是Animal?
        if let someAnimal = animal {
            print("An animal was initialized with a species of \(someAnimal.species)")
        }
        
        let anyAnimal = Animal.init(species: "")
        if anyAnimal == nil {
            print("animal = nil")
        }
        
        
        //枚举类型的可失败构造器
        enum TemperatureUnit {
            case Kelvin,Celsius,Fahrenheit
            init ? (symbal : Character) {
                switch symbal {
                case "K":
                    self = .Kelvin
                case "C":
                    self = .Celsius
                case "F":
                    self = .Fahrenheit
                default:
                    return nil
                }
            }
        }
        
        let temp = TemperatureUnit.init(symbal: "F")
        if temp != nil {
            print("initial success")
        }
        let temp1 = TemperatureUnit.init(symbal: "C")
        if temp1 == nil {
            print("initial false")
        }
        
        
        //带原始值的枚举类型的可失败构造器
        //带原始值的枚举类型会自带一个可失败构造器init?(rawValue:)，该可失败构造器有一个名为rawValue的参数，其类型和枚举类型的原始值类型一致，如果该参数的值能够和某个枚举成员的原始值匹配，则该构造器会构造相应的枚举成员，否则构造失败。
        enum Temperature : Character {
            case Kelvin = "K",Celsius = "C",Fahrenheit = "F"
        }
        let t = Temperature.init(rawValue: "D")
        let t1 = Temperature.init(rawValue: "C")
        if t == nil {
            print("false")
        }
        if t1 != nil {
            print("success")
        }
        
        
        //构造失败的传递
        //类，结构体，枚举的可失败构造器可以横向代理到类型中的其他可失败构造器。类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。
        //无论是向上代理还是横向代理，如果你代理到的其他可失败构造器触发构造失败，整个构造过程将立即终止，接下来的任何构造代码不会再被执行。
        
        //注意
        //可失败构造器也可以代理到其它的非可失败构造器。通过这种方式，你可以增加一个可能的失败状态到现有的构造过程中。
        class Product {
            let name : String
            init ? (name : String) {
                if name.isEmpty {return nil}
                self.name = name
            }
        }
        
        class CartItem : Product {
            let quantity : Int
            init ? (quantity : Int,name : String) {
                if quantity < 1 {return nil}
                self.quantity = quantity
                super.init(name: name)
            }
        }
        
        //重写可失败构造器
        class Document {
            var name : String?
            init() { }
            init ? (name : String) {
                self.name = name
            }
        }
        
        class Adocument : Document {
            override init() {
                super.init()
                self.name = "[Untitled]"
            }
            override init(name: String) {
                super.init()
                if name.isEmpty {
                    self.name =  "[Untitled]"
                } else {
                    self.name = name
                }
            }
        }
        
        //你可以在子类的非可失败构造器中使用强制解包来调用父类的可失败构造器。比如，下面的UntitledDocument子类的name属性的值总是"[Untitled]"，它在构造过程中使用了父类的可失败构造器init?(name:)：
        
        class UntitledDocument : Document {
            override init() {
                super.init(name: "[Untitled]")! //抢劫报
            }
        }
        
        
        //可失败构造器 init！
        //通常来说我们通过在init关键字后添加问号的方式（init?）来定义一个可失败构造器，但你也可以通过在init后面添加惊叹号的方式来定义一个可失败构造器（init!），该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象。
        //你可以在init?中代理到init!，反之亦然。你也可以用init?重写init!，反之亦然。你还可以用init代理到init!，不过，一旦init!构造失败，则会触发一个断言。
        
        //必要构造器
        //在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器：
        //在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符：
        
        class Class {
            var name : String
            required init(name : String){
                self.name = name
                print("构造器实现----\(name)")
            }
        }
        class SubClass : Class {
            required init(name: String) {
                super.init(name: name)
            }
        }
        
        let c = Class.init(name: "yang")
        let c1 = SubClass.init(name: "tao")
        print(c.name,c1.name)
        
        
        //通过闭包或者函数来设置属性的默认值
        /*
         如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值。每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
         
         这种类型的闭包或函数通常会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最后返回这个临时变量，作为属性的默认值。
         
         下面介绍了如何用闭包为属性提供默认值：
         */
        
        //        class SomeClass {
        //            let someProperty: SomeType = {
        //                // 在这个闭包中给 someProperty 创建一个默认值
        //                // someValue 必须和 SomeType 类型相同
        //                return someValue
        //            }()
        //        }
        //注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。
        
        //注意
        //如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。同样，你也不能使用隐式的self属性，或者调用任何实例方法。
        
        
        struct Checkerboard {
            let boardColors: [Bool] = {
                var temporaryBoard = [Bool]()
                var isBlack = false
                for i in 1...8 {
                    for j in 1...8 {
                        temporaryBoard.append(isBlack)
                        isBlack = !isBlack
                    }
                    isBlack = !isBlack
                }
                return temporaryBoard
            }()
            func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
                return boardColors[(row * 8) + column]
            }
        }
        
        let board = Checkerboard()
        print(board.boardColors)

    }
    
    
    //继承
    func test7 () {
        //继承
        /*
         一个类可以继承另一个类的方法，属性和其它特性。当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类）。在 Swift 中，继承是区分「类」与其它类型的一个基本特征。
         
         在 Swift 中，类可以调用和访问超类的方法，属性和下标，并且可以重写这些方法，属性和下标来优化或修改它们的行为。Swift 会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。
         
         可以为类中继承来的属性添加属性观察器，这样一来，当属性值改变时，类就会被通知到。可以为任何属性添加属性观察器，无论它原本被定义为存储型属性还是计算型属性。
         
         注意
         Swift 中的类并不是从一个通用的基类继承而来。如果你不为你定义的类指定一个超类的话，这个类就自动成为基类。
         */
        
        //定义一个基类 不继承于其他类的类称为基类
        
        class Vehicle {
            var currentSpeed = 0.0
            var description : String { //只读计算属性description
                return "traveling at \(currentSpeed) miles per hour"
            }
            func makeNoise() {
                //什么都不做 子类处理
            }
        }
        
        //子类生成
        //子类生成指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性，并且可以进一步完善。你还可以为子类添加新的特性。
        //为了指明某个类的超类，将超类名写在子类名的后面，用冒号分隔：
        
        class SomeClass : Vehicle {
            //子类继承Vehicle
        }
        //新的Bicycle类自动获得Vehicle类的所有特性，比如currentSpeed和description属性，还有它的makeNoise()方法。
        class Bike : Vehicle {
            var hasBasket = true
        }
        let bike = Bike()
        bike.hasBasket = false
        bike.currentSpeed = 9.0
        print(bike.description)
        //子类还可以继续被其它类继承，下面的示例为Bicycle创建了一个名为Tandem（双人自行车）的子类：
        class Tandem : Bike {
            var numberPerson = 2
        }
        
        
        //重写
        /*
         子类可以为继承来的实例方法，类方法，实例属性，或下标提供自己定制的实现。我们把这种行为叫重写。
         
         如果要重写某个特性，你需要在重写定义的前面加上override关键字。这么做，你就表明了你是想提供一个重写版本，而非错误地提供了一个相同的定义。意外的重写行为可能会导致不可预知的错误，任何缺少override关键字的重写都会在编译时被诊断为错误。
         
         override关键字会提醒 Swift 编译器去检查该类的超类（或其中一个父类）是否有匹配重写版本的声明。这个检查可以确保你的重写定义是正确的。
         
         
         当你在子类中重写超类的方法，属性或下标时，有时在你的重写版本中使用已经存在的超类实现会大有裨益。比如，你可以完善已有实现的行为，或在一个继承来的变量中存储一个修改过的值。
         
         在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或下标：
         
         在方法someMethod()的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod()方法。
         在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
         在下标的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标。
         
         */
        
        class Train : Vehicle {
            override func makeNoise() {
                print("火车声")
            }
        }
        
        let train = Train()
        train.makeNoise()
        
        //重写属性
        //你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性。子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。你在重写一个属性时，必需将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同类型的属性相匹配的。
        
        //你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供 getter 和 setter 即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性
        //注意
        //如果你在重写属性中提供了 setter，那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。
        
        class Car : Vehicle {
            var gear = 1
            override var description: String {
                return super.description + "in gear \(gear)"
            }
        }
        let car = Car()
        car.currentSpeed = 90.0
        print(car.description)
        
        //从写属性观察器
        //注意
        //你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供willSet或didSet实现是不恰当。
        //此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。
        
        class AutoCar : Car {
            override var currentSpeed: Double {
                didSet {
                    gear = Int(currentSpeed/10.0) + 1
                }
            }
        }
        
        let autoCar = AutoCar()
        autoCar.currentSpeed = 90.0
        print("aotoCar gear is \(autoCar.gear)")
        
        //防止重写
        /*
         
         你可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。
         
         如果你重写了带有final标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final 的。
         
         你可以通过在关键字class前添加final修饰符（final class）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错。
         */
        
        class People {
            final var weight = 34.0
            var job = "coder"
            func goToWork() -> Void {
                print("go to work")
            }
        }
        
        //        class Man : People {
        //            override var weight = 90.0
        //
        //        }

    }
    
    //下标
    func test6() {
        //下标
        //下标可以定义在类、结构体和枚举中，是访问集合，列表或序列中元素的快捷方式。可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法。举例来说，用下标访问一个Array实例中的元素可以写作someArray[index]，访问Dictionary实例中的元素可以写作someDictionary[key]。
        
        //一个类型可以定义多个下标，通过不同索引类型进行重载。下标不限于一维，你可以定义具有多个入参的下标满足自定义类型的需求。
        
        //下表语法
        //        subscript (index : Int) -> Int {
        //            get {
        //                    return 4
        //            }
        //            set(newValue) {
        //                //执行赋值操作
        //            }
        //        }
        
        //如同只读计算型属性，可以省略只读下标的get关键字：
        //        subscript(index : Int) -> Int {
        //            return 5
        //        }
        
        
        struct TimeTable {
            let multipier : Int
            subscript(index : Int) -> Int {
                return multipier * index
            }
        }
        let threeTimeTable = TimeTable(multipier : 3)
        print(threeTimeTable[6])
        //在上例中，创建了一个TimesTable实例，用来表示整数3的乘法表。数值3被传递给结构体的构造函数，作为实例成员multiplier的值。
        //你可以通过下标访问threeTimesTable实例，例如上面演示的threeTimesTable[6]。这条语句查询了3的乘法表中的第六个元素，返回3的6倍即18。
        
        
        //下表用法
        //        例如，Swift 的Dictionary类型实现下标用于对其实例中储存的值进行存取操作。为字典设值时，在下标中使用和字典的键类型相同的键，并把一个和字典的值类型相同的值赋给这个下标：
        //
        //        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        //        numberOfLegs["bird"] = 2
        //        上例定义一个名为numberOfLegs的变量，并用一个包含三对键值的字典字面量初始化它。numberOfLegs字典的类型被推断为[String: Int]。字典创建完成后，该例子通过下标将String类型的键bird和Int类型的值2添加到字典中。
        //
        
        
        //下标选项
        //标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值。
        //一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载。
        
        
        struct Matrix {
            let rows : Int,columns : Int
            var grid : [Double]
            init(rows : Int,columns : Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(repeatElement(0.0, count: 3))
            }
            
            func indexIsValidForRow(row : Int,column : Int) -> Bool {
                return row >= 0 && row < rows && column < columns && column >= 0
            }
            
            subscript(row : Int,column : Int) -> Double {
                get {
                    assert(indexIsValidForRow(row: row, column: column), "index out of range")
                    return grid[(row * column) + column]
                }
                set {
                    assert(indexIsValidForRow(row: row, column: column),"index out of range")
                    grid[(row * column) + column] = newValue
                }
            }
        }
        //Matrix提供了一个接受两个入参的构造方法，入参分别是rows和columns，创建了一个足够容纳rows * columns个Double类型的值的数组。通过传入数组长度和初始值0.0到数组的构造器，将矩阵中每个位置的值初始化为0.0。关于数组的这种构造方法请参考创建一个空数组。
        //你可以通过传入合适的row和column的数量来构造一个新的Matrix实例：
        var matrix = Matrix(rows : 2,columns : 2)
        //将row 和 column 的值传入下标来为矩阵设置值，下标的入参使用逗号分隔
        matrix[0,1] = 1.5
        matrix[1,0] = 3.2
        //上面两条语句分别调用下标的 setter 将矩阵右上角位置（即row为0、column为1的位置）的值设置为1.5，将矩阵左下角位置（即row为1、column为0的位置）的值设置为3.2：
        //Matrix下标的 getter 和 setter 中都含有断言，用来检查下标入参row和column的值是否有效。为了方便进行断言，Matrix包含了一个名为indexIsValidForRow(_:column:)的便利方法，用来检查入参row和column的值是否在矩阵范围内
        
        
        
        //        //下标
        //        struct GetName {
        //            var name : String
        //            subscript(firstName : String) -> String {
        //                get {
        //                    return firstName + name
        //                }
        ////                set {
        ////
        ////                }
        //            }
        //        }
        //
        //        let getName = GetName.init(name: "ming")
        //        print(getName["xiao"])


    }
    
    //实例方法 和 类方法
    func test5() -> Void {
        //方法
        //实例方法
        //结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活地在你创建的类型（类/结构体/枚举）上定义方法。
        class Counter {
            var count = 0
            func increment() -> Void {
                count += 1
            }
            func increment(by aCount : Int)  {
                count += aCount
            }
            
            func reset () {
                count = 0
            }
        }
        
        /*
         Counter类定义了三个实例方法：
         
         increment让计数器按一递增；
         increment(by: Int)让计数器按一个指定的整数值递增；
         reset将计数器重置为0。
         Counter这个类还声明了一个可变属性count，用它来保持对当前计数器值的追踪。
         */
        let counter = Counter()
        counter.increment()
        counter.increment(by: 10)
        counter.reset()
        counter.increment(by: 20)
        print(counter.count)
        //函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用），详情参见指定外部参数名。方法参数也一样，因为方法就是函数，只是这个函数与某个类型相关联了。
        //self属性  类型的每一个实例都有一个隐含属性叫做self，self完全等同于该实例本身。你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例。
        //上面例子中的increment方法还可以这样写：
        //        func increment() {
        //            self.count += 1
        //        }
        //使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时你可以使用self属性来区分参数名称和属性名称。
        struct Point {
            var x = 0.0,y = 0.0
            func theRightX(x : Double) -> Bool {
                return self.x > x
            }
        }
        
        let somePoint = Point(x : 4.0,y : 5.0)
        let isBig = somePoint.theRightX(x: 3.0)
        if isBig {
            print("big")
        }
        
        //在实例方法中修改值类型
        //结构体和枚举是值类型，默认情况下，值类型的属性不能在它的实例方法中被修改；
        //但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变(mutating)行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的self属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
        
        // 要使用可变方法，将关键字mutating 放到方法的func关键字之前就可以了：
        struct MutablePoint {
            var x = 0.0,y = 0.0
            mutating func moveByX(deltaX:Double,deltaY:Double) {
                x += deltaX
                y += deltaY
            }
        }
        
        var mutablePoint = MutablePoint(x:2.0,y:3.0)
        mutablePoint.moveByX(deltaX: 3.0, deltaY: 4.0)
        print("the point noew is \(mutablePoint.x)   \(mutablePoint.y)")
        //上面的Point结构体定义了一个可变方法 moveByX(_:y:) 来移动Point实例到给定的位置。该方法被调用时修改了这个点，而不是返回一个新的点。方法定义时加上了mutating关键字，从而允许修改属性。注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性
        
        //在可变方法中给属性赋值
        struct MutablePoint1 {
            var x = 0.0,y = 0.0
            mutating func moveBy (x deltaX : Double,y deltaY : Double) {
                self = MutablePoint1(x : x + deltaX,y : y + deltaY)
            }
        }
        
        //枚举的可变方法可以把self设置为同一枚举类型中不同的成员：
        enum Switch {
            case Off,High,Low
            mutating func next() {
                switch self {
                case .Off:
                    self = .Low
                case .Low:
                    self = .High
                default:
                    self = .High
                }
            }
        }
        
        
        //类型方法   类方法
        //实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法。在方法的func关键字之前加上关键字class，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现。
        //       类  在方法 func 的前边加上 <#class#> 关键字，来制定类型方法，类还可以使用关键字 class 来允许子类重写父类的方法实现
        //        在OC中，你只能为类添加类方法，在swift中，你可以为所有的嘞、结构体。、枚举添加类方法，使用关键字<#static#>  每一个类型方法都被他所支持的类型所包含
        //        使用点语法调用
        class SomeClass {
            class func someMethod() {
                print("这是一个类方法")
            }
        }
        SomeClass.someMethod()
        
        
        
        struct LevelTracker {
            static var highUnlockedLevel = 1
            var currentLevel = 1
            static func unlock(_ level : Int) {
                if level > highUnlockedLevel {
                    highUnlockedLevel = level
                }
            }
            
            static func isUnlocked(_ level : Int) -> Bool {
                return level < highUnlockedLevel
            }
            
            @discardableResult
            mutating func advance(to level : Int) -> Bool {
                if LevelTracker.isUnlocked(level) {
                    currentLevel = level
                    return true
                } else {
                    return false
                }
            }
        }
        
        
        class Player {
            var tracker = LevelTracker()
            let playerName : String
            func complete(level : Int) {
                LevelTracker.unlock(level + 1)
                tracker.advance(to: level + 1)
            }
            init(name : String) {
                playerName = name
            }
        }
        
        var  playerOne = Player(name : "xiaohong")
        playerOne.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highUnlockedLevel)")
        
        playerOne = Player(name : "hehe")
        if playerOne.tracker.advance(to: 6) {
            print("noe level is 6")
        } else {
            print("unLock")
        }

    }
    
    
    //属性
    func test4() {
        //属性
        
        //存储属性
        struct FixedLengthRange {
            var firstValue : Int
            let length : Int
        }
        var rangeOfThreeItem = FixedLengthRange(firstValue : 6,length : 4)
        rangeOfThreeItem.firstValue = 10;
        print(rangeOfThreeItem.firstValue,rangeOfThreeItem.length)
        //解释：FixedLengthRange 的实例包含一个名为 firstValue 的变量存储属性和一个名为 length 的常量存储属性。在上面的例子中，length 在创建实例的时候被初始化，因为它是一个常量存储属性，所以之后无法修改它的值。
        
        //常量结构体的存储属性
        //如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行：
        //        let constRange = FixedLengthRange(firstValue : 10,length : 5)
        //        constRange.firstValue = 20
        //        print(constRange.firstValue)
        //因为 rangeOfFourItems 被声明成了常量（用 let 关键字），即使 firstValue 是一个变量属性，也无法再修改它了。
        //这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。但是引用类型 class就不一样，把一个引用类型的实例赋值给一个常量后，还是可以改变该常量的变量属性
        
        
        //延迟存储属性
        //延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。
        //注意
        //必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
        
        //注意
        //如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
        
        
        //存储属性 实例变量
        //如果您有过 Objective-C 经验，应该知道 Objective-C 为类实例存储值和引用提供两种方法。除了属性之外，还可以使用实例变量作为属性值的后端存储。
        //Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。
        
        
        //计算属性
        struct Point {
            var x = 0.0,y = 0.0
        }
        struct Size {
            var width = 0.0,height = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
            var center : Point {
                get {
                    let centerX = origin.x - (size.width/2)
                    let centerY = origin.y - (size.height/2)
                    return Point(x: centerX,y : centerY)
                }
                set(newPoint) {
                    origin.x = newPoint.x - (size.width/2)
                    origin.y = newPoint.y - (size.height/2)
                }
            }
        }
        var square = Rect(origin : Point(x:0.0,y:0.0),size : Size(width : 10.0,height : 10.0))
        let initialCenter = square.center
        square.center = Point(x:15.0,y:15.0)
        print(square.origin.x,square.origin.y)
        //简化set声明 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。下面是使用了简化 setter 声明的
        //        set {
        //            origin.x = newValue.x - (size.width/2)
        //            origin.y = newValue.y - (size.height/2)
        //        }
        
        
        //只读计算属性
        //只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
        //注意
        //必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值。
        //只读计算属性的声明可以去掉 get 关键字和花括号：
        struct cuboid {
            var width = 0.0,height = 0.0,depth = 0.0
            var volume : Double {
                return width * height * depth
            }
        }
        //这个例子定义了一个名为 Cuboid 的结构体，表示三维空间的立方体，包含 width、height 和 depth 属性。结构体还有一个名为 volume 的只读计算属性用来返回立方体的体积。为 volume 提供 setter 毫无意义，因为无法确定如何修改 width、height 和 depth 三者的值来匹配新的 volume。然而，Cuboid 提供一个只读计算属性来让外部用户直接获取体积是很有用的。
        
        
        //属性观察器
        //willSet 在新的值被设置之前调用
        //didSet 在新的值被设置之后立即调用
        class StepCounter {
            var totalStep : Int = 0 {
                willSet(newTotalSteps){
                    print("About to set totalSteps to \(newTotalSteps)")
                }
                didSet {
                    if totalStep > oldValue {
                        print("Added \(totalStep - oldValue) steps")
                    }
                }
            }
        }
        
        let stepConter = StepCounter()
        stepConter.totalStep = 200
        stepConter.totalStep = 360
        stepConter.totalStep = 500
        
        
        //集合 set, Swift 中的Set类型被写为Set<Element>，这里的Element表示Set中允许存储的类型，和数组不同的是，集合没有等价的简化形式。
        var letters = Set<Character>()
        letters.insert("C")
        letters = [] //赋值空集合
        
        var favourite : Set<String> = ["play soccer","play basketball","swimming"]
        //一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明。然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个Set并且该数组字面量中的所有元素类型相同，那么你无须写出Set的具体类型。favoriteGenres的构造形式可以采用简化的方式代替
        var fav : Set = ["haha","hehe"]
        print(fav,favourite)
        fav.insert("lala")
        favourite.insert("play pingpang")
        if fav.isEmpty {
            print("empty")
        } else {
            print("not empty")
        }
        fav.insert("gogo")
        let haha = fav.remove("haha")
        print(haha ?? "optional xxx") //返回可选类型
        
        if fav.contains("hehe") {
            print("contain")
        } else {
            print("not contain")
        }
        
        //Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
        for item in fav.sorted() {
            print(item)
        }
        
        //集合操作
        //你可以高效地完成Set的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。
        
        let a : Set = [1,2,3,4,5]
        let b : Set = [2,4,6,8,10]
        let c = a.intersection(b)
        let d = a.symmetricDifference(b)
        let f = a.union(b)
        let g = a.subtracting(b)
        print("\(c)\n\(d)\n\(f)\n\(g)\n")
        //使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
        //使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
        //使用union(_:)方法根据两个集合的值创建一个新的集合。
        //使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
        
        /*集合成员关系和相等
         1、使用是否相等运算符 == 来判断两个及合是否包含全部相同的值
         2、使用isSubset(of:)方法来判断一个集合的值是否也被包含在另外一个集合中
         3、使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
         4、使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
         5、使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
         */
        
        let set1 : Set = [1,2,3,4,5,6]
        let set2 : Set = [2,3,4]
        let set3 : Set = [4,90]
        let isSub = set1.isSubset(of: set2)
        let isSuper = set1.isSubset(of: set2)
        let isJoint = set1.isDisjoint(with: set3)
        print(isSub,isSuper,isJoint)
        
        //字典
        var numberOfInterger = [Int : String]() //创建一个 [Int : String] 类型空字典
        numberOfInterger[16] = "sixteen"
        numberOfInterger[3] = "three"
        numberOfInterger = [:]//如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作[:]（中括号中放一个冒号）：
        
        //使用字典字面量创建字典
        var numberOfString : [String : String] = ["hh":"haha","ll":"lala"]
        numberOfString["pp"] = "papa"
        print(numberOfInterger,numberOfString)
        //和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。
        var airports = ["hh":"haha","pp":"papa"]
        print(airports)
        print(airports.count)
        if airports.isEmpty {
            print("empty")
        }
        airports["hh"] = "hehe"
        print(airports)
        airports.updateValue("kaka", forKey: "hh")
        if let oldValue = airports["pp"] {
            print(oldValue)
        }
        //我们还可以使用下标语法来通过给某个键的对应值赋值为nil来从字典里移除一个键值对：
        airports["beijing"] = "peking airport"
        airports["beiijing"] = nil
        //使用remove移除
        airports["beijing"] = "peking airport"
        let value = airports.removeValue(forKey: "beijing")
        print(value ?? "可选没有值")
        //字典遍历
        for (a,b) in airports {
            print(a,b)
        }
        //通过访问keys或者values属性，我们也可以遍历字典的键或者值：
        for key in airports.keys {
            print(key)
        }
        for value in airports.values {
            print(value)
        }
        
        //如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例的 API 的参数，可以直接使用keys或者values属性构造一个新数组：
        let newArray = [String](airports.keys)
        let newArray1 = [String](airports.values)
        print(newArray,newArray1)
        
        //创建空数组
        let voidArray = [String]()
        let voidArray1 = [Int]()
        var array1 = [Int]()
        var array2 : [String] = ["aa"]//
        array2.append("bb")
        array1.append(90)
        print(voidArray,voidArray1,array1)

    }
    
    //类 结构体
    func test3() {
        //类和结构体
        /* 共同点
         定义属性用于存储值
         定义方法用于提供功能
         定义下表操作使得可以通过下表语法来访问实例所包含的值
         定义构造器用于生成初始化值
         通过扩展以增加默认实现的功能
         实现协议已提供某种标准功能
         
         类还有如下附加功能
         1、继承 允许一个类继承另一个类的特征
         2、类型转换允许在运行时检查和解释一个类实例的类型
         3、析构器允许一个类实例释放任何其所被分配的资源
         4、引用计数允许对一个类的多次引用
         
         注意
         结构体总是通过被复制的方式在代码中传递，不使用引用计数
         */
        
        //定义 class struct 注意
        //在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。因此请使用UpperCamelCase这种方式来命名（如SomeClass和SomeStructure等），以便符合标准 Swift 类型的大写命名风格（如String，Int和Bool）。相反的，请使用lowerCamelCase这种方式为属性和方法命名（如framerate和incrementCount），以便和类型名区分。
        
        struct SomeStruct {
            var width = 0
            var height = 0
        }
        
        class SomeClass {
            var someStruct = SomeStruct()
            var a = false
            var name : String?
        }
        
        //类的实例 结构体实例
        //结构体和类都使用构造器语法来生成新的实例。构造器语法的最简单形式是在结构体或者类的类型名称后跟随 <#一对空括号#>，通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值。构造过程章节会对类和结构体的初始化进行更详细的讨论。
        let someC = SomeClass()
        var someS = SomeStruct()
        someC.name = "haha"
        someS.width = 33
        someC.someStruct.height = 30
        print(someC.someStruct.height)
        
        
        //结构体类型的成员逐一构造器
        //所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中：
        let bStruct = SomeStruct(width : 30,height : 90)
        //与结构体不同，类实例没有默认的成员逐一构造器
        
        //结构体和枚举是值类型
        //值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
        //在之前的章节中，我们已经大量使用了值类型。实际上，在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。
        //在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。
        
        
        //类是引用类型   结构体 枚举是值类型
        //与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
        
        //恒等运算符
        //因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
        //等价于（===）
        //不等价于（!==）
        
        //请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
        //“等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
        // “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
        
        
        //类和结构体的选择
        /*
         按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
         
         该数据结构的主要目的是用来封装少量相关简单数据值。
         有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
         该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
         该数据结构不需要去继承另一个既有类型的属性或者行为。
         
         举例来说，以下情境中适合使用结构体：
         
         几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
         一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
         三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
         在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。
         
         */
    }
    
    
    //闭包 枚举
    func test2() {
        //闭包
        //一般形式
        //            { (<#parameters#>) -> <#return type#> in
        //                <#statements#>
        //        }
        //例
        let plus : (Int,Int) ->Int = {
            (a : Int,b : Int) -> Int in
            return a + b
        }
        print(plus(2,3))
        
        //swift可以根据上下文判断变量类型，可以省略Int类型
        let plus1 : (Int,Int) -> Int = {
            (a,b) -> Int in //变量的括号也可省略
            return a + b
        }
        print(plus1(2,3))
        
        let plus2 : (Int,Int) -> Int = {
            a,b in
            return a + b
        }
        print(plus2(2,3))
        
        //单表达式可以隐式返回，可以省略return
        let plus3 : (Int,Int) -> Int = {
            a,b in a + b
        }
        print(plus3(2,3))
        
        //如果闭包没有参数，则可以省略in
        let plus4 : () -> Int = {
            return 100 + 200
        }
        print(plus4())
        
        //既没有参数也没有返回值 return in 都省略
        let plus5 : () -> Void = {
            print("啥都没有")
        }
        print(plus5())
        //总结：闭包类型是由参数类型和返回值类型决定的，跟函数一样，第一个闭包类型是(Int,Int)->Int,plus4的类型为()->Int,plus5的类型为()->Void;这里的plus类型就是闭包类型，意思是声明一个plusX变量，变量右边是具体实现，左边是变量值；右边给左边赋值；
        
        //给闭包起别名
        typealias aliasClosure = (String,String)->String
        let addString : aliasClosure = {
            (aString,bString) in
            return aString + bString
        }
        print(addString("hello","world"))
        
        
        //尾随闭包
        //若函数参数的最后一个是闭包类型，则可以省略参数标签，然后可以将闭包表达式写在函数调用括号后边；
        func funcClosure(voidClosure : () -> Void) {
            voidClosure()
        }
        //正常写法
        funcClosure(voidClosure:{
            print("haha")
        })
        //尾随闭包写法
        funcClosure() {
            print("haha")
        }
        
        //也可以把括号省略
        funcClosure {
            print("haha")
        }
        
        //值捕获
        //闭包可以在其被定义的上下文捕获变量或者常量；
        //akeIncrementer(forIncrement:) 有一个 Int 类型的参数，其外部参数名为 forIncrement，内部参数名为 amount，该参数表示每次 incrementer 被调用时 runningTotal 将要增加的量。makeIncrementer 函数还定义了一个嵌套函数 incrementer，用来执行实际的增加操作。该函数简单地使 runningTotal 增加 amount，并将其返回。
        func makeIncrementer(forIncrement count:Int) ->()->Int {
            var total = 0
            func incream()->Int {
                total += count
                return total
            }
            return incream
        }
        let addCount = makeIncrementer(forIncrement: 10)
        print(addCount)
        
        
        //逃逸闭包
        
        
        //自动闭包
        
        
        //枚举
        
        
        //关联值
        enum Barcode {
            case upc(Int,Int,Int,Int)
            case qrCode(String)
        }
        //以上代码可以这么理解：定义一个名为Barcode的枚举类型，它的成员值具有(Int,Int,Int,Int) 类型的关联值ups，另一个成员是具有string类型关联值得qrCode，这个定义不提供任何Int或String类型的关联值，它只是定义了，当Barcode常量和变量等于Barcode.upc或Barcode.qrCode时，可以存储的关联值的类型。
        var product = Barcode.upc(23, 34, 4443, 544)
        // 上面的例子创建了一个名为productBarcode的变量，并将Barcode.upc赋值给它，关联的元组值为(23, 34, 4443, 544)。
        product = .qrCode("wwwwwwwwwww")
        //这时，原始的Barcode.upc和其整数关联值被新的Barcode.qrCode和其字符串关联值所替代。Barcode类型的常量和变量可以存储一个.upc或者一个.qrCode（连同它们的关联值），但是在同一时间只能存储这两个值中的一个。
        
        switch product {
        case .upc(let numer, let manu, let pro, let check):
            print("\(pro)  \(numer)")
        default:
            print("")
        }
        
        
        //原始值
        enum controlCharactor : Character {
            case tab = "\t"
            case linefeed = "\n"
            case cReturn = "\r"
        }
        
        
        //原始值的隐士赋值
        enum Planet: Int {
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        //在上面的例子中，Plant.mercury的显式原始值为1，Planet.venus的隐式原始值为2，依次类推。
        //        当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
        enum PlanetDirect : String {
            case north,south,east,west
        }
        //上面的例子中  PlanetDirect.north 的原始值为 north，以此类推
        
        //使用枚举成员的rawValle属性可以访问该枚举成员的原始值
        let earth = Planet.earth.rawValue //原始值为3
        let sunsetDirect = PlanetDirect.west.rawValue //原始值为west
        
        
        //使用原始值初始化枚举实例
        let possiblPlanet = Planet(rawValue : 7)
        // possiblePlanet 类型为 Planet? 值为 Planet.uranus
        print(earth,sunsetDirect,possiblPlanet)
        
        //递归枚举

    }
    
    func test1() {
        //变量
        let π = 3.14159
        let 你好 = "你好世界"
        let 🐶🐮 = "dogcow"
        print(π,你好,🐶🐮)
        
        
        //整数与浮点型转换
        //整数与浮点型转换必须显示指定类型
        //如果不转换类型，则无法相加
        let a : Int = 3
        let b : Double = 0.23233
        let c = Double(a) + b
        print(c)
        //浮点型转化为整形
        //当用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说 4.75 会变成 4，-3.9 会变成 -3。不是四舍五入，是直接去掉小数部分
        let d = Int(b)
        print(d)
        
        //类型别名 把String类型取名为 NSString
        typealias NSString = String
        let ss : NSString = "wwww"
        print(ss)
        
        //布尔值
        //Bool 布尔值只有true false
        //不需要将变量或者常量声明为某个特定的类型，因为swift会根据上下文类型判断来得知
        //        var hasSuccess = false
        //        hasSuccess = true
        
        //元组 tuple
        //元组把多个值组合成一个值，元组内可以是任意类型
        let internetError = (404,"Not Found")
        print(internetError)
        //变量internetError的类型是 (Int,String)，值是  (404,"Not Found") 一个元组把一个Int类型和一个String类型组合起来；
        //你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为 (Int, Int, Int) 或者 (String, Bool) 或者其他任何你想要的组合的元组。
        
        //可以将一个元组的内容拆解开，然后使用，例如
        let (tupleFirst,tupleSec) = internetError
        print("元组第一个元素是 \(tupleFirst)  第二个元素是 \(tupleSec)")
        //如果只需要元组的一部分数据，你可使用下划线 _ 来标记
        let (tupleFir,_) = internetError //使用下划线来忽略不想要的数据
        print(tupleFir)
        //你还可以使用下标来访问元组的数据，下标从0开始
        print(internetError.0,internetError.1)
        //你还可以在定义元组的时候给元素命名，例如
        let internetSuccess = (stateCode : 200,description : "OK")
        //通过元素名字来获取元素的值
        print(internetSuccess.stateCode,internetSuccess.description)
        //作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个 (Int, String) 元组来描述是否获取成功。和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用
        //注意：
        //元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组
        
        
        
        //可选类型 optional 用来处理值可能缺失的时候 可选类型表示 （1、有值，或值等于x  2、没有值）、
        //注意：
        //C 和 OC 并没有可选类型概念，最接近的就是OC的一个特性，要么返回一个对象或者值，要么返回nil，nil表示缺少一个合法的对象或者值；然而 Swift 的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值。
        //举例
        //        let optionalInt = "123"
        //let convertString = Int(optionalInt)
        // convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        //print(convertString) //打印为  Optional(123)
        //所以它返回一个可选类型（optional）Int，而不是一个 Int。一个可选的 Int 被写作 Int? 而不是 Int。问号暗示包含的值是可选类型，也就是说可能包含 Int 值也可能不包含值。（不能包含其他任何值比如 Bool 值或者 String 值。只能是 Int 或者什么都没有。）
        
        
        //可以为可选值 赋值为nil，表示没有值
        //haveValue 表示一个可选的 Int 值，404
        //        var haveValue : Int? = 404
        //        haveValue = nil
        //print(haveValue)
        //注意：
        //nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型
        
        //如果你声明了一个可选的变量或者常量，编译器会自动赋值nil
        var surveyAnswer: String?
        surveyAnswer = "uuuuu"
        // surveyAnswer 被自动设置为 nil
        //声明可选变量没有赋值，会自动赋值nil
        //        let hahaha : Double?
        //        hahaha = 33.14
        //print(surveyAnswer,hahaha)
        //注意：
        //Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
        
        
        //强制解析 ！
        //当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：
        //注意：
        //使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 ! 来强制解析值之前，一定要确定可选包含一个非 nil 的值
        
        
        //可选绑定
        //使用可选绑定来判断可选类型是否有值，如果有值就赋值给一个变量或者常量，可选绑定可以用在if 语句 和 while语句中，这条语句不仅可以判断可选类型是否有值，还可以将可选类型中的值赋值给变量或者常量；
        let someOptional : String? = "haha"
        if let a = someOptional {
            print(a)
        }
        //这段代码解释为：如果someOptional返回的可选String有值，创建一个 名叫a的常量并把值付给他；
        //你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条件语句来处理，如下所示：
        if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
        // 输出 "4 < 42 < 100"
        
        if let firstNumber = Int("4") {
            if let secondNumber = Int("42") {
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("\(firstNumber) < \(secondNumber) < 100")
                }
            }
        }
        // 输出 "4 < 42 < 100"
        
        
        
        
        
        //隐式解析可选类型
        //有时候可选类型在第一次赋值时就知道它一定有值，这种情况每次都判断可选类型有没有值是非常低效的，这种类型的可选状态称为隐士解析可选类型，把想要用作可选类型的后边问好？改成！即可，(String?----->String!)来声明一个可选类型；
        //
        let aString : String? = "astring"
        let bString = aString!//需要叹号来获取值
        print(bString)
        let cString : String! = "cString"
        let dString : String = cString//不需要叹号
        print(dString)
        
        
        
        
        //错误处理
        
        
        //断言
        //断言函数
        let age = 4
        assert(age > 0, "age can not less than zero")
        //需要使用断言的环境
        //整数类型的下标索引被传入一个自定义下标实现，但是下标索引值可能太小或者太大。
        //需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
        //一个可选值现在是 nil，但是后面的代码运行需要一个非 nil 值。
        
        
        
        //术语
        //运算符
        //赋值运算符 =
        //组合赋值运算符 += -+
        //比较运算符 > < >= <=
        //逻辑运算符 && || !
        //算术运算符 + - * / %
        //三目运算符 ? :
        //区间运算符  闭区间运算符：a...b 比如for循环 半开区间运算符 a...<b
        //空合运算符 a ?? b 将a进行空判断，如果a包含一个值就进行解封，没有值就默认为b，a类型必须是可选类型，默认值b必须和a的值类型相同；
        //空合运算符是对一下代码精简的表述
        //        a != nil ? a! : b   上述代码使用了三目运算符。当可选类型 a 的值不为空时，进行强制解封（a!），访问 a 中的值；反之返回默认值 b。无疑空合运算符（??）提供了一种更为优雅的方式去封装条件判断和解封两种行为，显得简洁以及更具可读性。
        
        let defaultColorName = "red"
        var userDefinedColorName: String?   //默认值为 nil
        var colorNameToUse = userDefinedColorName ?? defaultColorName
        // userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"
        
        
        //字符串 和 字符
        let hello : String = "hello world"
        print(hello)
        print(hello.endIndex)
        print(hello[hello.startIndex])
        print(hello[hello.index(after: hello.startIndex)])
        print(hello[hello.index(before: hello.endIndex)])
        let index = hello.index(hello.startIndex, offsetBy: 4)
        print(hello[index])
        
        
        //比较字符串相等 ==  ！= 

    }
    
    
    func test() -> Void {
        //        var myString = "hello world"
        //        myString = "hahha"
        //        print(myString)
        //
        //        let yourString = "hello your world";
        //        print(yourString);
        
        
        let name = "xiaoming";print(name)//在一行内书写多条语句时，要加上 分号,只=只有一条语句加不加都可以，swift没有要求
        
        //        let a= 2 + 3 运算符不能直接挨着变量名，要使用空格间隔开，不然会报错；
        
        
        //        let distance : NNNNN = "200"
        //        print(distance)
        
        //        var xiao : Float //声明变量
        //        xiao = 3.88
        //        print(xiao)
        //
        //        var name1 : String //声明字符串变量
        //        name1 = "llllllllllll";
        //        print(name1)
        //
        //
        //        let 好 = "kkk"
        //        print(好)
        
        
        
        /*
         
         // \(变量名) 可用此方式插入字符串
         var name2 = "她"
         var email = "eeeeeeee@qq.com"
         print("\(name2) 的email为 \(email)")
         
         var varibleOptional : String?
         var optionalType: Optional<String>
         
         varibleOptional = "bnoashioilahusias"
         print(varibleOptional)
         
         //如果一个可选类型的实例只包含一个值，那么就可以使用 后缀操作符 ！ 来访问这个值；
         optionalType = "jshklahjskjlha"
         print(optionalType!)
         
         
         //        var myString : String? = nil
         //        myString = "hsjkghjbaskjhjks"
         //
         //        if myString != nil {
         //            print(myString)
         //        } else {
         //            print("myString = nil")
         //        }
         
         
         //强制解析
         var string : String?
         string = "hsklhkjlhkljlk"
         if string != nil {
         print(string!)//强制解析可选值，使用感叹号 ❗️ 打印为 Optional("hsklhkjlhkljlk!")
         } else {//使用 ！来获取一个不存在的值会导致报错，在强制解析之前要确定可选包含一个非 nil 的值；
         print("string = nil")
         }
         
         
         //自动解析
         //在声明可选变量时可用 ！ 替换 ？，这样在使用可选变量时就不用使用 ！来获取它的值，会自动解析；
         
         var secString : String!
         secString = "opopopopopo"
         if secString != nil {
         print(secString)
         } else {
         print("secString = nil")
         }
         
         
         //可选绑定
         //使用可选绑定来来判断可选类型是否包含值，如果包含，就把这个值赋值给一个临时常量或者变量，可选绑定可以用到if 和 while语句中，来对可选值进行判断包含不包含值，
         var bindString : String?
         bindString = "binding string"
         if let aString = bindString {
         print(bindString)
         } else {
         print("没有可选值")
         }
         
         
         //常量 一旦设置为常量，在应用程序中就无法更改 这和OC一致；
         //常量可以是任意数据类型，整形 字符串 浮点型 枚举类型常量
         //常量类似于变量，区别在于常量的值一旦设定就不能改变，而变量的值可以随意更改。
         //常量是用 let 修饰；变量使用var修饰
         
         
         //类型标注
         //当你声明常量或者变量的时候可以加上类型标注（type annotation），说明常量或者变量中要存储的值的类型。如果要添加类型标注，需要在常量或者变量名后面加上一个冒号和空格，然后加上类型名称         var constantName:<data type> = <optional initial value>
         
         var myInt : Int = 33;
         myInt = 44
         var myStr : String = "jlijlijklk"
         myStr = "808909890"
         let myStrings : String = "gklghkj"
         print(myInt)
         print(myStr,myStrings)
         
         //常量命名
         //  常量命名可以由 字母 下划线 数字组成；常量需要以字母或者下划线开头 swift区分大小写
         
         
         //swift 字面量 ：能够直截了指出变量的类型并为变量赋值的值；
         let aNumber = 3         //整型字面量
         let aString = "Hello"   //字符串字面量
         let aBool = true        //布尔值字面量
         
         //整形字面量
         //整型字面量可以是一个十进制，二进制，八进制或十六进制常量。 二进制前缀为 0b，八进制前缀为 0o，十六进制前缀为 0x，十进制没有前缀：
         let decimalInteger = 17           // 17 - 十进制表示
         let binaryInteger = 0b10001       // 17 - 二进制表示
         let octalInteger = 0o21           // 17 - 八进制表示
         let hexadecimalInteger = 0x11     // 17 - 十六进制表示
         print(hexadecimalInteger,decimalInteger,binaryInteger,octalInteger)
         
         let octalValue = 0o22
         print(octalValue) //18
         
         //十进制浮点型字面量由十进制数字串后跟小数部分或指数部分（或两者皆有）组成。十进制小数部分由小数点 . 后跟十进制数字串组成。指数部分由大写或小写字母 e 为前缀后跟十进制数字串组成，这串数字表示 e 之前的数量乘以 10 的几次方。例如：1.25e2 表示 1.25 ⨉ 10^2，也就是 125.0；同样，1.25e－2 表示 1.25 ⨉ 10^－2，也就是 0.0125。
         
         //十六进制浮点型字面量由前缀 0x 后跟可选的十六进制小数部分以及十六进制指数部分组成。十六进制小数部分由小数点后跟十六进制数字串组成。指数部分由大写或小写字母 p 为前缀后跟十进制数字串组成，这串数字表示 p 之前的数量乘以 2 的几次方。例如：0xFp2 表示 15 ⨉ 2^2，也就是 60；同样，0xFp-2 表示 15 ⨉ 2^-2，也就是 3.75。
         
         //负的浮点型字面量由一元运算符减号 - 和浮点型字面量组成，例如 -42.5。
         
         //浮点型字面量允许使用下划线 _ 来增强数字的可读性，下划线会被系统忽略，因此不会影响字面量的值。同样地，也可以在数字前加 0，并不会影响字面量的值。
         
         let decimalDouble = 12.1875       //十进制浮点型字面量
         let exponentDouble = 1.21875e1    //十进制浮点型字面量
         let hexadecimalDouble = 0xC.3p0   //十六进制浮点型字面量
         
         
         
         //字符串字面量 "" 双引号包含
         //字符串型字面量中不能包含未转义的双引号 （"）、未转义的反斜线（\）、回车符或换行符。
         
         let yourString : String
         yourString = "hklhkjhkljhklj\nuhiouhuhkj\rssasasasa\"ewewewew\t\""
         print(yourString)
         
         /*
         \0	空字符
         \\	反斜线 \
         \b	退格(BS) ，将当前位置移到前一列
         \f	换页(FF)，将当前位置移到下页开头
         \n	换行符
         \r	回车符
         \t	水平制表符
         \v	垂直制表符
         \'	单引号
         \"	双引号
         \000	1到3位八进制数所代表的任意字符
         \xhh...	1到2位十六进制所代表的任意字符
         */
         
         
         /*
         布尔型字面量
         布尔型字面量的默认类型是 Bool。
         布尔值字面量有三个值，它们是 Swift 的保留关键字：
         true 表示真。
         false 表示假。
         nil 表示没有值。
         */
         var isEmpty : Bool = false;
         isEmpty = true
         print(isEmpty)
         
         
         
         //运算符  运算符是一个符号，用来告诉编译器来执行一个数学运算或逻辑运算
         //swift 有一下几种运算符
         //算术运算符 + - * / % ++ --
         //逻辑运算符 && || ! 与或非
         //赋值运算符 =
         //比较运算符 == > < != >= <=
         //位运算符 位运算符用来对二进制位进行操作，~,&,|,^，分别为取反，按位与与，按位与或，按位与异或运算
         //区间运算符
         //其他运算符
         
         let A : Int = 10
         let B : Int = 30
         print("A + B = \(A + B)")
         print("A != B   === \(A != B)")
         
         
         //repeat...while 循环 首先会执行一次表达式，如果表达式为true，则继续执行，知道表达式为false；
         var LL : Int = 30
         repeat {
         LL = LL + 1
         print(LL)
         } while LL < 35
         
         //fallthrough 语句
         //在大多数语言中，switch 语句块中，case 要紧跟 break，否则 case 之后的语句会顺序运行，而在 Swift 语言中，默认是不会执行下去的，switch 也会终止。如果你想在 Swift 中让 case 之后的语句会按顺序继续运行，则需要使用 fallthrough 语句。
         //默认不继续往下进行，直到遇到fallthrough语句才会往下执行；
         var index = 20
         switch index {
         case 10:
         print(index)
         case 20:
         print("hahahahahaha")
         fallthrough
         case 30:
         print("30")
         fallthrough
         case 40:
         print("40")
         case 50:
         print("30")
         case 60:
         print("30")
         default:
         print("default")
         }
         
         
         //for in循环
         var someString : [String] = ["www","errrr","ytrtrtrt"]
         someString .append("yyyyy")
         someString.insert("ooooooo", at: 2)
         for aString in someString {
         print(aString)
         }
         
         //字符串
         let bString = String("pppppp")
         //        bString?.insert("M", at: bString?.3)
         var cString = String.init()
         cString = "mmmmmm"
         print(cString)
         
         //空字符串
         var dString = ""
         dString = dString + "yiuyiouyio"
         dString += "YYYYY"
         print(dString)
         let fString = String()
         if fString.isEmpty {
         print("是空串")
         } else {
         print("不是空串")
         }
         
         
         //字符串插入值
         //字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。 您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中：
         var varA   = 20
         let constA = 100
         var varC:Float = 20.0
         var stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
         print( stringA )
         
         
         //字符串连接
         //字符串可以用➕来连接
         var varD = "D";
         var varF = "F"
         varD = varD + "D"
         print("====== \(varD + varF)")
         
         
         //字符串长度
         print("字符串长度为 = \(varD.lengthOfBytes(using: String.Encoding.utf8))")
         print("字符串长度 = \(varD.characters.count)")
         
         
         //字符串比较  使用 == 比较字符串
         print("两个字符串是否相等   \(varD == varF)")
         
         
         // Unicode 字符串
         
         
         
         //字符 character     Swift 的字符是一个单一的字符字符串字面量，数据类型为 Character。
         //swift不能创建空字符变量
         let char1 : Character = "W";
         let char2 : Character = "E";
         print(char1,char2)
         //遍历字符串中的字符
         for char in varD.characters {
         print(char)
         }
         
         //字符串追加字符 字符串
         varD.append("p")
         varF.append(varD)
         
         
         
         
         //字典
         /* Swift 字典用来存储无序的相同类型数据的集合，Swift 字典会强制检测元素的类型，如果类型不同则会报错。
         Swift 字典每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。
         和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
         Swift 字典的key没有类型限制可以是整型或字符串，但必须是唯一的。
         如果创建一个字典，并赋值给一个变量，则创建的字典就是可以修改的。这意味着在创建字典后，可以通过添加、删除、修改的方式改变字典里的项目。如果将一个字典赋值给常量，字典就不可修改，并且字典的大小和内容都不可以修改。
         */
         
         //创建字典
         //var someDict =  [KeyType: ValueType]()
         //var someDict = [Int: String]()
         //var dic1 = [String:String]()
         var dic : [Int:String] = [2:"eeee",3:"rrrr",4:"tttt"];
         var dic1 : [String:String] = ["222":"aaa"]
         let var2 = dic[2]
         let var4 = dic[4]
         let var3 = dic[3]
         print(var2,var3,var4)
         
         //修改字典的值 两种方法
         dic.updateValue("TTTT", forKey: 4)
         dic[3] = "RRRR";
         print(dic)
         
         //移除键值对
         dic.removeValue(forKey: 2)
         print(dic)
         //也可以通过指定键的值为 nil 来移除 key-value（键-值）对
         dic[3] = nil
         dic[5] = "YYY"
         
         print(dic)
         
         //遍历字典
         for (key,value) in dic {
         print("key = \(key),value = \(value)")
         }
         //我们也可以使用enumerate()方法来进行字典遍历，返回的是字典的索引及 (key, value) 对
         for (key,value) in dic.enumerated(){
         print("字典 key \(key) -  字典 (key, value) 对 \(value)")
         }
         
         //字典转换为数组
         let keys = [Int](dic.keys)
         let values = [String] (dic.values)
         print(keys,values,"键值对数目 = \(dic.count)")
         //count属性 isEmpty属性
         
         
         
         
         
         
         /*数组 可以有相同的值，但是必须是在不同的位置上，数组中值的类型必须是一致的；
         Swift 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
         Swift 数组会强制检测元素的类型，如果类型不同则会报错，Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。
         如果创建一个数组，并赋值给一个变量，则创建的集合就是可以修改的。这意味着在创建数组后，可以通过添加、删除、修改的方式改变数组里的项目。如果将一个数组赋值给常量，数组就不可更改，并且数组的大小和内容都不可以修改。
         */
         
         var someArray : [String] = ["wwww","rrrr","uuuuu"]
         //根据下表来获取数组内的值
         let firstValue = someArray[2]
         //修改数组
         someArray.append("00000")
         someArray.insert("KKK", at: 2)
         someArray[2] = "jjjj"
         print(someArray)
         
         //遍历数组
         var nameString = [String]()
         nameString.append("haha")
         nameString.append("heihei")
         nameString.insert("nihao", at: 1)
         for name in nameString {
         print(name)
         }
         
         for (index,name) in nameString.enumerated() {
         print(index,name)
         }
         
         //合并数组   使用➕
         let mergeArray = someArray + nameString
         print(mergeArray)
         //count属性 isEmpty属性
         
         */
        
        
        
        
        
        /*
         
         //函数
         self.thirdFunc()
         let aR =  self.firstfunc()
         let aResult = self.secFunc(paras: "ni", paras1: 4, paras2: "hao")
         print(aResult,aR)
         
         let arrayInt : [Int] = [2,3,5,-200,3000,900]
         let result = self.minMax(array: arrayInt)
         print(result.minmum,result.max)
         //需要注意的是，元组的成员不需要在元组从函数中返回时命名，因为它们的名字已经在函数返回类型中指定了
         
         let rrr = self.minMaxFunc(array: []) //传进去的是空数组
         print(rrr ?? "为空")//默认值 ？？
         
         
         //函数 参数标签 和 参数名称 默认情况下函数的参数名作为函数的参数标签；
         func someFunction(firstParameterName: Int, secondParameterName: Int) {
         // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
         }
         someFunction(firstParameterName: 1, secondParameterName: 2)
         
         //指定参数标签 funcLabel参数标签  你可以在函数名称前指定它的参数标签，中间以空格分隔
         func func2(funcLabel argument : [Int]) ->() {
         print(argument)
         }
         func2(funcLabel: [1,2,3])
         //函数没有返回值可以不写 ->()
         func func3(argument : String) {
         print(argument)
         }
         func3(argument: "hahha")
         
         //忽略参数标签  如果不想为某函数添加一个标签，可以使用 _ (下划线)来替代参数标签
         func noLabel(_ argument1 : String,_ argument2 : Int) {
         print(argument1,argument2.description)
         }
         noLabel("kkkkkk", 3)
         
         //默认参数值 你可以在函数体中通过给参数赋值来为任意一个参数定义默认值（Deafult Value）。当默认值被定义后，调用这个函数时可以忽略这个参数。
         //可以看出使用默认值参数  可以忽略也可以不忽略，调用方法的 时候会出现两种提示；一种是忽略一种是不忽略的方法；
         func defaultArgument(withoutDefault : Int,defaultArgument : Int = 4) {
         print(withoutDefault,defaultArgument)
         }
         defaultArgument(withoutDefault: 3, defaultArgument: 5)
         func defaultStringArgument(withoutDefault : String,defaultArgument : Int = 20) {
         print(withoutDefault,defaultArgument)
         }
         defaultStringArgument(withoutDefault: "kkkk", defaultArgument: 3)
         defaultStringArgument(withoutDefault: "llll")
         
         //可变参数 参数后边加上 ... 表示参数是可变的,numbers表示 float类型的一个数组
         //注意：一个函数只能拥有一个可变参数
         func mutableArgumentFunc(numbers : Float...) -> Float {
         var number : Float = 0.0
         for value in numbers {
         number += value
         }
         return Float(number)
         }
         print(mutableArgumentFunc(numbers: 3.9,4.9,4.7))
         
         //输入输出参数 inout关键字
         //函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误(compile-time error)。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
         //定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。想获取更多的关于输入输出参数的细节和相关的编译器优化，请查看输入输出参数一节。你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
         //输入输出函数是对函数体外产生呢过影响的一种方式；
         
         func inoutArgument(_ a : inout Int,b : inout Int)  {
         let temp = a;
         a = b;
         b = temp;
         print(a,b)
         }
         var a = 4
         var b = 90
         inoutArgument(&a, b: &b)
         
         //函数类型
         //每个函数都有特定的类型，类型是由参数类型和返回值类型组成；
         func addFunc( a : Int,b : Int) -> Int {
         return a+b
         }
         func multiplyFunc(_ a : Int,_ b : Int) ->Int {
         return a*b
         }
         //上边两个函数可以说是（Int,Int）-> Int类型，可以解读为有两个Int类型的参数，返回一个Int类型的值；
         //下边函数 ()->void 可以解读为没有参数 返回类型为void类型的函数
         func fun5(){
         
         }
         
         //使用函数类型
         //在swift中，函数也是一种类型，你可以使用函数像其他类型一样，你可以定义一个类型为函数的变量或常量，并适当的赋值给它
         //例
         var funcTypeVarible : (Int,Int)->Int = addFunc(a:b:)
         //这句代码可以解读为: 变量funcTypeVarible是 一个参数由两个Int类型 返回值类型为 Int的函数 类型变量
         print(funcTypeVarible(2,4))
         //有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样
         funcTypeVarible = multiplyFunc(_:_:)
         print(funcTypeVarible(2,4))
         
         //函数类型作为参数类型
         //例
         func func6(argument1 : (Int,Int)->Int,argument2 : Int,argument3 : Int) {
         print(argument1(argument2,argument3))
         }
         func6(argument1: funcTypeVarible, argument2: 4, argument3: 5)
         // 不想看到参数标签，函数参数名前 加 _，并使用空格分开即可
         func func7(_ argument1 : (Int,Int)->Int,_ argument2 : Int,_ argument3 : Int) {
         print(argument1(argument2,argument3))
         }
         func7(funcTypeVarible, 3, 4)
         
         //函数类型作为返回值类型
         //你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型。
         //例 两个函数类型都为 (Int)->Int
         func forword(_ a : Int) -> Int {
         return a+1
         }
         func backword(_ b : Int) -> Int {
         return b - 1
         }
         
         func funcReturnFunc(isBool : Bool) -> (Int)->Int {
         return isBool ? backword : forword
         }
         
         //嵌套函数 在函数内部定义函数称为嵌套函数，函数外部定义函数称之为全局函数，全局函数的作用域是整个类，函数内部的函数作用域在函数内部；
         //nested functions 嵌套函数
         //global functions 全局函数
         //enclosing function 外围函数
         //上边的函数都在viewDidLoad函数内部定义，都称之为嵌套函数
         
         
         */
        
        
        
        
        
        /*
         
         
         //闭包   block -oc
         //闭包是自包含的代码块
         //闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数比较相似。闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作
         
         //闭包表达式语法
         //        { (<#parameters#>) -> <#return type#> in
         //            <#statements#>
         //        }
         
         let names = ["asjk","nkk","opop","vvvn"]
         func cccloseure(_ s1 : String,_ s2 : String) -> Bool {
         return s1 > s2
         }
         var result = names.sorted(by: cccloseure)
         print(result)
         
         result = names.sorted(by:  { (s1 : String,s2 : String) -> Bool in
         return s1 > s2
         })
         //返回值箭头 -> 和围绕在参数的括号也可以被省略
         //如下
         result = names.sorted(by: {s1,s2  in return s1 > s2})
         
         //单表达式闭包    单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
         //如下
         result = names.sorted(by: {s1,s2 in s1 > s2})
         
         //参数名称缩写
         //Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
         //如下  在这个例子中，$0和$1表示闭包中第一个和第二个 String 类型的参数。
         result = names.sorted(by: {$0 > $1})
         
         //运算符方法
         // 实际上还有一种更简短的方式来编写上面例子中的闭包表达式。Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断出你想使用大于号的字符串函数实现：
         result = names.sorted(by: >)
         
         
         //尾随闭包
         func someFunctionThatTakesAClosure (closure : () -> Void) {
         // 函数体部分
         }
         
         // 以下是不使用尾随闭包进行函数调用
         someFunctionThatTakesAClosure(closure: {
         // 闭包主体部分
         })
         
         // 以下是使用尾随闭包进行函数调用
         someFunctionThatTakesAClosure() {
         // 闭包主体部分
         }
         
         //        在闭包表达式语法一节中作为 sorted(by:) 方法参数的字符串排序闭包可以改写为：
         result = names.sorted() { $0 > $1 }
         //        如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
         result = names.sorted { $0 > $1 }
         
         
         //参数为两个int类型 返回值也为int类型的闭包
         let add = { (a : Int,b : Int) -> Int in
         a + b
         }
         print(add(2,3))
         //没有参数没有返回值的闭包
         let sentence = { print("没有参数没有返回值的闭包")
         
         }
         print(sentence)
         
         
         
         */
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //无参有返回值函数
    func firstfunc() -> String {
        return "nihao"
    }
    
    //有参有返回值函数
    func secFunc(paras : String,paras1 : Int,paras2 : String) ->String {
        let pp = paras + paras2 + paras1.description
        return pp
    }
    
    //无参无返回值函数
    func thirdFunc() ->(){
        print("无参无返回值")
    }


    //多重返回值函数  返回元组tuple
    func minMax(array : [Int]) -> (minmum : Int,max : Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin,currentMax)
    }


    //可选元组返回类型 返回值后边加一个❓
    //上边的例子为例
    func minMaxFunc(array : [Int]) -> (minmum : Int,max : Int)? {
        if array.isEmpty { return nil } //加入传入的数组为空，就返回nil，这就是返回可选元组
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin,currentMax)
    }


    
    
    


}












