//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//begin

var shoppingList = ["catfish", "water", "tulips", "blue paint"]

shoppingList[1] = "bottle of water"

var occupations = [
        "Malcolm": "Captain",
        "Kaylee": "Mechanic",
    ]

occupations["Jayne"] = "Public Relations"


var optionalString: String? = "Hello"
optionalString == nil

//var optionalName: String? = "John Appleseed"

var optionalName: String? = nil
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

let interestingNumbers = [
"Prime": [2, 3, 5, 7, 11, 13],
"Fibonacci": [1, 1, 2, 3, 5, 8],
"Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greet("Bob", day: "Tuesday")

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
    return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)


numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

numbers.map(){
    (number: Int) -> Int in
    let result = 3 * number
    return result
}

numbers.sort() {
    (num1: Int, num2: Int) -> Bool in
    return num1>num2
}

[1,5,3,12,2].sort(){$0>$1}

let aaa: Int?;
aaa = 123;
//aaa = 456;

class Shape {
    //var numberOfSides = 0
    
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
//    init(_: String) {
//        self.name = $(0);
//    }
    
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//var shape = Shape("abc")
var shape = Shape(name: "abc")
shape.numberOfSides = 7

var shapeDescription = shape.simpleDescription()



// 大小
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self { case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
         }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

//let formValue = Rank.fromRaw(3);
let formValue = Rank(rawValue: 3);

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//花色
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}
//let hearts = Suit.Hearts
let hearts: Suit = .Hearts
let heartsDescription = hearts.simpleDescription()
let heartColor = hearts.color()


struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


// 协议 拓展
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//class
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

//struct
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


//enum //TODO
enum SimpleEnum: ExampleProtocol {
    case enum1, enum2
    
    var simpleDescription: String {
        get{
            switch self {
            case .enum1:
                return "A simple structure enum1"
            case .enum2:
                return "A simple structure enum2"
            }
        }
    }
    
    mutating func adjust() {
        switch self {
        case .enum1:
            return
        case .enum2:
            return
        }
    }
}

var c = SimpleStructure()
c.adjust()
let cDescription = c.simpleDescription


//泛型
//func repeatFunc<ItemType>(item: ItemType, times: Int) -> [ItemType] {
//    var result = [ItemType]()
//    
//    for i in 0..<times {
//        result[i] = item
//    }
//    return result
//}
//repeatFunc("knock", times: 4)

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)


//func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                return true
//            }
//         }
//    }
//    return false
//}
//anyCommonElements([1, 2, 3], [3])


//let possibleNumber = "123"
//let convertedNumber = possibleNumber.toInt()
// convertedNumber 被推测为类型 "Int?", 或者类型 "optional Int"


var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
print("The dictionary of airports contains \(airports.count) items."
)

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Internation", forKey: "DUB") {
print("The old value for DUB was \(oldValue).")
}


//func
func sayHello(personName: String, age: Int) -> String {
    let greeting = "Hello, " + personName + "!" + "age \(age)"
    return greeting
}
print(sayHello("Anna", age:18))
// prints "Hello, Anna!"

//print(sayHello("Brian", 20))
print(sayHello("Brian", age: 20))
//print(sayHello(personName:"Brian", age: 20))

// prints "Hello, Brian!"


//func  externalParameterName
func sayHello2(externalParameterName personName: String, age: Int) -> String {
    let greeting = "Hello, " + personName + "!" + "age \(age)"
    return greeting
}
print(sayHello2(externalParameterName: "Anna", age:18))
// prints "Hello, Anna!"

//print(sayHello("Brian", 20))
print(sayHello2(externalParameterName: "Brian", age: 20))
// prints "Hello, Brian!"

//func  externalParameterAge
func sayHello3(externalParameterName personName: String, externalParameterAge age: Int) -> String {
    let greeting = "Hello, " + personName + "!" + "age \(age)"
    return greeting
}
print(sayHello3(externalParameterName: "Anna", externalParameterAge:18))
// prints "Hello, Anna!"

//print(sayHello("Brian", 20))
print(sayHello3(externalParameterName: "Brian", externalParameterAge: 20))
// prints "Hello, Brian!"

//func  #
//func sayHello4(#personName: String, #age: Int) -> String {
//    let greeting = "Hello, " + personName + "!" + "age \(age)"
//    return greeting
//}
//print(sayHello4(externalParameterName: "Anna", externalParameterAge:18))
//// prints "Hello, Anna!"
//
////print(sayHello("Brian", 20))
//print(sayHello4(externalParameterName: "Brian", externalParameterAge: 20))
//// prints "Hello, Brian!"


func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a=b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt )")
// prints "someInt is now 107, and anotherInt is now 3"



//.UPCA  .QRCode ==> 枚举成员值
enum Barcode {
    //枚举关联值
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909_51226, 3)

productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
//    case .UPCA(let numberSystem, let identifier, let check): print("UPC-A with value of \(numberSystem), \(identifier), \(check).")
//    case .QRCode(let productCode):
//    print("QR code with value of \(productCode).")
    
    case let .UPCA(numberSystem, identifier, check): print("UPC-A with value of \(numberSystem), \(identifier), \(check).")
    case let .QRCode( productCode):
    print("QR code with value of \(productCode).")

}

/*枚举原始值 原始值具有相同的类型 原始值可以是字符串,字符,或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。当整型值被用于原始值,如果其他枚举成员没有值时,它们会自动递增。*/
/*对于一个特定的枚举成员,它的原始值始终是相同的。 关联值是当你在创建一个基于枚举成员的新常量或变量时才会被设置,并且每次当你这么做 得时候,它的值可以是不同的*/

//使用枚举成员的 toRaw 方法可以访问该枚举成员的原始值
//使用枚举的 fromRaw 方法来试图找到具有特定原始值的枚举成员
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}


/*与其他编程语言所不同的是,Swift 并不要求你为自定义类和结构去创建独立的接口和实
 现文件。你所要做的是在一个单一文件中定义一个类或者结构体,系统将会自动生成面向
 其它代码的外部接口。*/

//函数和闭包是引用类型
//结构体和枚举是值类型
//类是引用类型

/*实际上,在 Swift 中,所有的基本类型:
整数(Integer)、
浮点数(floating-point)、
布尔值(Booleans)、
字符串(string)、
数组(array)和字典(dictionaries)
都是值类型,并且都是以结构体的形式在后台所实现*/

/*Swift 中类和结构体有很多共同点。共同处在于: 
 定义属性用于储存值
 定义方法用于 供功能
 定义下标用于通过下标语法访问值
 定义初始化器用于生成初始化值
 通过扩展以增加默认实现的功能
 符合协议以对 类 供标准功能
 
 与结构体相比,类还有如下的附加功能:
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 取消初始化器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用*/

/*结构体和类都使用初始化器语法来生成新的实例。初始化器语法的最简单形式是在结构体
 或者类的类型名称后跟随一个空括弧,如 Resolution()或 VideoMode()。通过这种方式所 创建的类或者结构体实例,其属均会被初始化为默认值*/


struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
// 输出 "The width of someResolution is 0"

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 输出 "The width of someVideoMode is 0"

someVideoMode.resolution.width = 12880
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 输出 "The width of someVideoMode is now 1280"

//结构体成员逐一初始化器
//与结构体不同,类实例没有默认的成员逐一初始化器
let vga = Resolution(width: 640, height: 480)

// 值类型鉴定
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
// 输出 "cinema is now 2048 pixels wide"

print("hd is still \(hd.width ) pixels wide")
// 输出 "hd is still 1920 pixels wide"

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East

if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// 输出 "The remembered direction is still .West"

//class
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"

tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// 输出 "The frameRate property of theEighty is now 30.0"

//Swift 内建了两个恒等运算符:
//等价于 ( === )
//不等价于 ( !== )
if tenEighty === alsoTenEighty {
    print("tenTighty and alsoTenEighty refer to the same Resolution instance.")
}
/*请注意“等价于”(用三个等号表示,===) 与“等于”(用两个等号表示,==)的不同:
 “等价于”表示两个类类型(class type)的常量或者变量引用同一个类实例。 
 “等于”表示两个实例的值“相等”或“相同”,判定时要遵照类设计者定义定义的评判标准,因 此相比于“相等”,这是一种更加合适的叫法。*/

/*按照通用的准则,当符合一条或多条以下条件时,请考虑构建结构体:
 结构体的主要目的是用来封装少量相关简单数据值。
 有理由预计一个结构体实例在赋值或传递时,封装的数据将会被拷贝而不是被引用。
 任何在结构体中储存的值类型属性,也将会被拷贝,而不是被引用。
 结构体不需要去继承另一个已存在类型的属性或者行为。*/


/*
 集合(Collection)类型的赋值和拷贝行为
 Swift 中数组(Array)和字典(Dictionary)类型均以结构体的形式实现。然而当数组被赋予一 个常量或变量,或被传递给一个函数或方法时,其拷贝行为与字典和其它结构体有些许不
 同。
 以下对数组和结构体的行为 述与对 NSArray 和 NSDictionary 的行为 述在本质上不
 同,后者是以类的形式实现,前者是以结构体的形式实现。NSArray 和 NSDictionary 实例 总是以对已有实例引用,而不是拷贝的方式被赋值和传递。
 注意:以下是对于数组,字典,字符串和其它值的拷贝的 述。 在你的代码中,拷贝好像 是确实是在有拷贝行为的地方产生过。然而,在Swift 的后台中,只有确有必要,实际 (actual)拷贝才会被执行。Swift 管理所有的值拷贝以确保性能最优化的性能,所以你也没 有必要去避免赋值以保证最优性能。(实际赋值由系统管理优化)
 
 字典类型的赋值和拷贝行为
 无论何时将一个字典实例赋给一个常量或变量,或者传递给一个函数或方法,这个字典会
 即会在赋值或调用发生时被拷贝。在章节结构体和枚举是值类型中将会对此过程进行详细
 介绍。
 如果字典实例中所储存的键(keys)和/或值(values)是值类型(结构体或枚举),当赋值或调用 发生时,它们都会被拷贝。相反,如果键(keys)和/或值(values)是引用类型,被拷贝的将 会是引用,而不是被它们引用的类实例或函数。字典的键和值的拷贝行为与结构体所储存
 的属性的拷贝行为相同。
 
 数组的赋值和拷贝行为
 在 Swift 中,数组(Arrays)类型的赋值和拷贝行为要比字典(Dictionary)类型的复杂的多。
 当操作数组内容时,数组(Array)能 供接近 C 语言的的性能,并且拷贝行为只有在必要时 才会发生。
 如果你将一个数组(Array)实例赋给一个变量或常量,或者将其作为参数传递给函数或方法
 调用,在事件发生时数组的内容不会被拷贝。相反,数组公用相同的元素序列。当你在一
 个数组内修改 一元素,修改结果也会在另一数组显示。
 
 ********************
 ********************数组copy
 ********************

 对数组来说,拷贝行为仅仅当操作有可能修改数组长度时才会发生。这种行为包括了附加
 (appending),插入(inserting),删除(removing)或者使用范围下标(ranged subscript)去替换这 一范围内的元素。
 只有当数组拷贝确要发生时,数组内容的行为规则与字典中键值的相
 同
 */

var aa = [1,2,3]
var bb = aa
var cc = aa

print(aa[0])
print(bb[0])
print(cc[0])

aa[0] = 42

//TODO maybe...
print(aa[0])
// 42
print(bb[0])
// 42
print(cc[0])
// 42

aa.append(4)
aa[0] = 777
print(aa[0])
// 777
print(bb[0])
// 42
print(cc[0])
// 42

//bb.unshare()
bb[0] = -105
print(aa[0])
// 777
print(bb[0])
// -105
print(cc[0])
// 42

//aa.copy();
//aa.shallow;

//储存属性变量

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数0,1,2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数6,7,8

//常量和存储属性

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数0,1,2,3
//rangeOfFourItems.firstValue = 6
// 尽管firstValue诗歌变量属性,这里还是会报错


//延迟存储属性
/*延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 
 @lazy 来标示一个延迟存储属性。
 
 注意:必须将延迟存储属性声明成变量(使用 var 关键字),因为属性的值在实例构造完成 之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值,因此无法声明成延迟 属性。
 
 延迟属性很有用,当属性的值依赖于在实例的构造过程结束前无法知道具体值的外部因素 时,或者当属性的值需要复杂或大量计算时,可以只在需要的时候来计算它*/

//存储属性和实例变量

//计算属性
/*注意:必须使用 var 关键字定义计算属性,包括只读计算属性,因为他们的值不是固定的。
 let 关键字只用来声明常量属性,表示初始化后再也无法修改的值。*/

//属性监视器
/*可以为除了 延迟存储属性 之外的其他存储属性添加属性监视器,也可以通过重载属性的方式 为继承的属性(包括存储属性和计算属性)添加属性监视器
 
 注意:不需要为无法重载的计算属性添加属性监视器,因为可以通过 setter 直接监控和响 应值的变化。
 
 注意:willSet 和 didSet 监视器在属性初始化过程中不会被调用,他们只会当属性的值在初始化之外的地方被设置时被调用。*/

//全局变量和局部变量
/*注意:全局的常量或变量都是延迟计算的,跟延迟存储属性相似,不同的地方在于,全局的
 常量或变量不需要标记@lazy 特性;局部范围的常量或变量不会延迟计算。*/


//类型属性
/*不管类型有多少个实例,这些属性都只有唯一一份*/
/*使用关键字 static 来定义值类型的类型属性,
 关键字 class 来为类(class)定义类型属性*/
/*注意:跟实例的存储属性不同,必须给存储型类型属性指定默认值,因为类型本身无法在初
 始化过程中使用构造器给类型属性赋值。*/



class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.incrementBy(5)
// 计数值现在是6
counter.reset()
// 计数值现在是0

class Counter1 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    
    func incrementBy2(amount: Int, _ numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

//# 显示 外部参数名称
//_ 隐藏 外部参数名称 覆盖默认行为
let counter1 = Counter1()
counter1.incrementBy(5, numberOfTimes: 3)
// counter value is now 15

counter1.incrementBy2(5, 3)

struct Point {
    var x=0.0,y=0.0

    mutating func moveByX(deltaX: Double, y deltaY: Double) { x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// 输出 "The point is now at (3.0, 4.0)"

//注意:不能在结构体类型常量上调用变异方法,因为常量的属性不能被改变,即使想改变的 是常量的变量属性也不行,详情参见存储属性和实例变量
let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
// this will report an error


//附属脚本

//附属脚本语法
//语法类似于实例方法和计算型属性的混合

/*附属脚本选项
 附属脚本允许任意数量的入参索引,并且每个入参类型也没有限制。附属脚本的返回值也可
 以是任何类型。附属脚本可以使用变量参数和可变参数,但使用写入读出(in-out)参数或 给参数设置默认值都是不允许的。*/

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍是\(threeTimesTable[6])")
// 输出 "3的6倍是18"


//2.13. 继承
/*在 Swift 中,继承是区分「类」与其它类型的一个基本特征。类可以调用和访问超类的方法,属性和附属脚本(subscripts),并且可以重写
 (override)这些方法,属性和附属脚本来优化或修改它们的行为*/

class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }

    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

class Bicycle: Vehicle {
    
    override init() {
        super.init()
        
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description())")
// Bicycle: 2 wheels; up to 1 passengers

//双人自行车
class Tandem: Bicycle {
    override init() {
        super.init()
        
        maxPassengers = 2
    }
}
let tandem = Tandem()
print("Tandem: \(tandem.description())")
// Tandem: 2 wheels; up to 2 passengers


class Car: Vehicle {
    var speed: Double = 0.0
    override init() { super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String { return super.description() + "; " + "traveling at \(speed) mph"
    }
}


let car = Car()
print("Car: \(car.description())")
// Car: 4 wheels; up to 5 passengers; traveling at 0.0 mph


/*你可以将一个继承来的只读属性重写为一个读写属性,只需要你在重写版本的属性里 供 getter 和 setter 即可。但是,你不可以将一个继承来的读写属性重写为一个只读属性。*/

class SpeedLimitedCar: Car {
    override var speed: Double {
    get {
        return super.speed
    }
    set {
        super.speed = min(newValue, 40.0)
    }
    }
}

let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
print("SpeedLimitedCar: \(limitedCar.description())")
// SpeedLimitedCar: 4 wheels; up to 5 passengers; traveling at 40.0 mp h


/*注意:你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。
 这 些属性的值是不可以被设置的,所以,为它们 供 willSet 或 didSet 实现是不恰当。此外还
 要注意,你不可以同时 供重写的 setter 和重写的属性观察器。如果你想观察属性值的变
 化,并且你已经为那个属性 供了定制的 setter,那么你在 setter 中就可以观察到任何值 变化了。*/

//自动挡汽车
class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
        didSet {
            gear = Int(speed / 10.0) + 1
        }
    }
    override func description() -> String {
        return super.description() + " in gear \(gear)"
    }
}

let automatic = AutomaticCar()
automatic.speed = 35.0
print("AutomaticCar: \(automatic.description())")
// AutomaticCar: 4 wheels; up to 5 passengers; traveling at 35.0 mph i n gear 4

//防止重写 @final


//构造过程
/*与 Objective-C 中的构造器不同,Swift 的构造器无需返回值,它 们的主要任务是保证新实例在第一次使用前完成正确的初始化。*/


// 好像不支持 静态代码块 构造代码块 构造函数
class classDemo {
    let aaa: Int;
    var bbb: String;
    var ccc: Double;
    
    var ddd: Float?;
    
//    {
//        aaa = 0
//        bbb = "abc"
//        ccc = 3.14
//    }
    
    init() {
        aaa = 0
        
        //aaa = 3
        bbb = "abc"
        ccc = 3.14
        print("aaa \(ddd)")
    }
    
}
/*注意:对 个类实例来说,它的常量属性只能在定义它的类的构造过程中修改;不能在子
 类中修改。*/

classDemo()

/*注意:当你为存储型属性设置默认值或者在构造器中为其赋值时,它们的值是被直接设置 的,不会触发任何属性观测器(property observers)。*/

struct Fahrenheit {
    var temperature = 32.0
}

struct Celsius {
    var temperatureInCelsius: Double = 0.0
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
    
//    init(fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
    
    init(_ fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    //_ 报错 重复定义
    init(__ kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

//let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
//// boilingPointOfWater.temperatureInCelsius 是 100.0
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)
//// freezingPointOfWater.temperatureInCelsius 是 0.0”

//let boilingPointOfWater = Celsius(fahrenheit: 212.0)
//// boilingPointOfWater.temperatureInCelsius 是 100.0
//let freezingPointOfWater = Celsius(kelvin: 273.15)
//// freezingPointOfWater.temperatureInCelsius 是 0.0”

let boilingPointOfWater = Celsius(212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(__: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0”



//结构体的逐一成员构造器 TO Continue














































































































































































































































































































































































































































































































































































































































































































































































































































































































































































