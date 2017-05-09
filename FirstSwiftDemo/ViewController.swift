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






class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        

        
        
        
        
        
        
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












