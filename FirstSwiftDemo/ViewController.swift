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












