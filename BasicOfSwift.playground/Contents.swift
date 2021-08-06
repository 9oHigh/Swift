import Swift
import UIKit

/*
 1. 상수와 변수, 기본적인 데이터타입에 대한 설명이다.
 상수선언 - let
 변수선언 - var
 let 이름 : 타입 = 값
 var 이름 : 타입 = 값
 타입이 명확하다면 생략가능
 */
let constant : String = "변경불가능"
var variable : String = "변경가능"

let sum : Int
let inputA : Int = 100
let inputB : Int = 200

let nickName : String
nickName = "Lee"
print(nickName)

//1과 0으로 표현할 수 없다!
var someBool: Bool  = true
someBool = false

//Int
var someInt: Int = -100

//Unit
var someUInt: UInt = 100

//Float, Double
var someFloat: Float = 3.14
var someDouble: Double = 3.14

//Charactor는 한자리의 단어만 가능하다.
var someChracter: Character = "A"

//String
var someString: String = "하하하"
someString = someString+someString
print(someString)

//Any,AnyObject,nil
//Any
var someAny: Any = 100 // 어떠한 타입이든 가져갈 수 있음, but 각각의 타입에 대입불가능

//AnyObject
class someClass{}
var someAnyObject: AnyObject = someClass()
// someAny = nil 은 불가능하다. 어떠한 타입이든 가능하지만 null값은 할당 불가능하다.



/*
 2.컬렉션 타입 (Array,Dictionary,Set) 자료구조는 어디서든 중요하다. 확실하게 알아둘것.
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */
//(1) Array
var integers: Array<Int> = Array<Int>()
//같은 표현 -> var 변수명: Array<Int/Double..> = [Int/Double..]() []
//같은 표현 -> var 변수명: [Int/Double..] = [] [v]
//마지막 표현이 간단하고 클린해보인다.

//원소추가 append
integers.append(1)
integers.append(100)
print(integers)

//원소가 있나 확인
print(integers.contains(1))

//원소 제거
integers.remove(at: 0) //해당 인덱스 삭제
//integers.removeAll() // 모든 원소 삭제
//integers.removeFirst() // 첫 번째 원소 삭제
//integers.removeLast() // 마지막 원소 삭제

//카운트
integers.count


//(2) Dictionary
var anyDictionary: Dictionary<String,Any> = [String:Any]()
//같은 표현 -> var/let 변수명: [타입:타입] = [:] 클린한 방법
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

//해당 키값에 대한 value 제거
anyDictionary.removeValue(forKey: "anotherKey")


//(3) Set
//축약형 표현이 없음
var integerSet: Set<Int> = Set<Int>()

//추가
integerSet.insert(1)
integerSet.insert(1)
integerSet.insert(100)
//이하 활용되어지는 메소드는 Array와 같음

//Set의 활용
let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,2,5,6,8]

//합치기/정렬/교집합/차집합
let union: Set<Int> = setA.union(setB)
let sortedUnion: [Int] = union.sorted()
let intersection: Set<Int> = setA.intersection(setB)
let subtracting: Set<Int> = setA.subtracting(setB)



/*
 3.함수 초급
 func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
 /* 함수 구현부 */
 return 반환값
 }
 으로 사용된다. 별반 차이없다.
 */
//반환값이 존재
func sum(a:Int,b:Int)->Int{
    return a+b
}

//반환값이 존재하지 않음
func anyFunc(name:String)->Void{
    print(name)
}

//매개변수가 존재하지 않음
func maxIntValue()->Int{
    return Int.max
}

//매개변수와 반환값 모두가 존재하지 않음
func hello() -> Void { print("Hello, World ~") }

//함수의 호출
sum(a:3,b:5)
anyFunc(name: "9oHigh")
maxIntValue()
hello()



/*
 3.함수 고급
 (1)매개변수에 기본적으로 전달될 값을 미리 정하는 방식
 (2)전달인자 레이블 - 호출시 사용자의 입장에서 매개변수의 역할을 명확히 표현하고자할때 사용
 (3)가변 매개변수 - 전달 받을 값의 개수를 알기 어려울때 사용 / 함수당 하나
 (4)데이터 타입으로서의 함수 - 스위프트는 다중 패러다임언어(함수형 프로그래밍을 포함)로서 함수자체를 변수,상수로 할당 및 매개변수로 사용가능하다.
 */

//매개변수 기본값 me 값을 고정으로 가지고 사용
func greeting(friend: String, me: String = "9oHigh"){
    print("Hello \(friend)! I'm \(me)!")
}
greeting(friend: "HOGU")

//전달인자 레이블 - 전달인자 레이블로 인해 위의 함수와 다른 것으로 스위프트에서는 인식한다.
//중요 : 함수내부에서는 매개변수를 사용하고 외부에서 호출할 경우에는 전달인자 레이블을 사용해야함!!
func greeting(to friend: String,from me: String = "9oHigh"){
    print("Hello \(friend)! I'm \(me)!")
}
greeting(to: "HaHa", from: "ZUZU")

//가변 매개변수 - ...을 사용하면 된다!
func sayHello(me: String, friends: String...)-> String{
    return "Hello \(friends)! I'm \(me)!"
}
print(sayHello(me: "9oHigh", friends: "HaHa","ZUZU"))

//데이터 타입으로서의 함수 - 타입이 다른 함수면 불가능하다!
//Example
var someFunc: (String,String)->Void = greeting(to:from:) // 함수를 변수로 활용
someFunc("Eric","9oHigh")

//Example
func runAnother(function: (String,String)->Void){
    function("Eric","9oHigh")
}
runAnother(function: greeting(friend:me:))
runAnother(function: someFunc)



/*
 4.조건문
 (1)if/else if/else
 (2)switch
 */
//조건문은 차이점없다. 다만 조건에 괄호가 없어도 된다.
//switch만 알아보자. switch문에서 디폴트문은 반드시 작성 / case문에 break가 자동으로 적용되어있다.
var someInteger: Int = 1
switch someInteger {
case 0:
    print("Zero")
case 1:
    print("One")
default:
    print("unKnown")
}



/*
 5.반복문
 (1)for _ in
 (2)while
 (3)repeat-while
 */
//for in 구문은 파이썬과 같다.
var loopIntegers = [1,2,3]
let people = ["9oHigh": 180,"Eric": 160,"Minsu": 150]

//기본적인 for in문
for number in loopIntegers{
    print(number)
}

//딕셔너리의 아이템은 키와 밸류로 구성된 튜플이므로 다음과 같이 사용한다.
for (name,height) in people{
    print("\(name)의 키는 다음과 같아.. \(height)cm!")
}

//while문 - 차이없음
while loopIntegers.count > 1 {
    loopIntegers.removeLast()
}

//repeat-while은 C언어의 do-while문이다.



/*
 6.옵셔널(Optional) / 중요중요!! 별표 돼지꼬리 떙땡!!
 - 값이 있을 수도, 없을 수도 있음을. 표현. 즉, nil이 할당 될 수 있는지 없는지 표현하는 것.
 - 명시적 : nil의 가능성을 코드만으로 표현할 수 있으므로 주석 작성 생략가능
 - 안전함 : 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않고 사용가능하며 예외 상황을 최소화 하는 안전한 코딩을 할 수 있음
 */
// 옵셔널을 이용한 매개변수와 함수
func maybeFunc(optionalParm: Int?){}
//옵셔널이 없는 함수
func noneFunc(optionalParm: Int){}
// 옵셔널을 적용한 매개변수가 있는 함수는 nil값의 적용이 가능하지만
// 그렇지 않은 매개변수와 함수는 사용할 수 없다.
maybeFunc(optionalParm: nil) // 가능
// noneFunc(optionalParm: nil) // 불가능

/*enum + general
enum Optional<Wrapped> : ExpressibleByNilLiteral{
    case none
    case some(Wrapped)
}
 */
//사용방법
let optionalValueOne: Optional<Int> = nil
//축약형
let optionalValueTwo: Int? = nil

//!를 사용하는 경우 - 암시적 추출 옵셔널
//!옵셔널변수는 기존 변수처럼 사용이 가능하다. ex) optionalValues = optionalValues + 1
var optionalValues: Int! = 100
switch optionalValues {
case .none:
    print("NONE")
case .some(let value):
    print("Value is \(value)")
}

//?를 사용하는 경우 - 일반적인 경우

var optionalValuesNext: Int? = 100
//?옵셔널 변수는 기존 변수처럼 사용이 불가능 ex) optionalValuesNext = optionalValuesNext + 1 -> 불가능



/*
 7.옵셔널 추출(Optional Unwrapping)!
 - 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것을 말함
 - 옵셔널 바인딩 - nil체크와 안전한 추출 / 옵셔널 안에 값이 들어있는지 확인 있으면 가져옴 / if - let 방식을 사용
 - 강제추출 - 추천하지 않음
 */
//if-let 방법을 활용한 옵셔널 추출!
func printName(_ name: String){
    print(name)
}
var myName: String! = nil

//여기서 name은 조건문 안에서만 사용가능 / 당연한..
//여러 옵셔널 변수를 사용할 수도 있음 [ , ]로 구분하여 사용!
if let name: String = myName{
    printName(name)
}else{
    print("myName == nil")
}
//강제추출방법 (? -> !)
var realName: String? = "9oHigh"
printName(realName!) // 강제 추출
//만약 nil값이면 런타임 오류가 발생한다. 추천하지 않는 방법.
