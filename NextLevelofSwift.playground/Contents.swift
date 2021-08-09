import UIKit
import Swift

/*
 구조체 - 핵심기능으로 C언어와 형태가 비슷함
 중요한 것은 구조체는 값(value)타입이고
 클래스는 레퍼런스타입이다!
 */
// 구조체 샘플
struct Sample{
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty: Int = 100 // 타입 프로퍼티
    //인스턴트 메소드
    func instanceMethod(){
        print("Instance Method!")
    }
    //타입 메소드
    static func typeMethod(){
        print("Type Method!")
    }
}

//구조체 사용
var mutable: Sample = Sample()
let immutable: Sample = Sample()

//구조체 접근
mutable.mutableProperty = 200 // 불변 프로퍼티는 접근 불가능
//let으로 선언된 인스턴스는 접근은 가능하나 프로퍼티나 메소드를 변경 불가능하다.
//immutable.mutableProperty = 200 -> 불가능!

//구조체 자체로서의 프로퍼티와 메소드를 사용가능
Sample.typeProperty = 300
Sample.typeMethod()
//하지만 인스턴스에서는 사용 불가능
//mutable.typeMethod() -> 불가능!

//학생 구조체 - 예시 / 연습
struct Student{
    var name: String = "unknow"
    var lecture : String = "Swift"
    static func selfIntroduce(){
        print("학생타입 입니다.")
    }
    func selfIntroduce(){
        print("저는 \(self.lecture)반 \(self.name)입니당~")
    }
}

Student.selfIntroduce() // 학생타입 입니다.

var lionHeart : Student = Student()
lionHeart.name = "9oHigh"
lionHeart.lecture = "스위프트"
lionHeart.selfIntroduce() // 저는 스위프트반 9oHigh입니당~



/*
 클래스 - 다중상속이 불가능
 - 재정의가 불가능한 static과 가능한 class 타입의 메소드
 - let으로 선언된 클래스의 경우에도 가변 프로퍼티의 값을 변경가능
 <-> 구조체의 형식으로는 불가능
 */
class newSample{
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty: Int = 100 // 타입 프로퍼티
    //인스턴트 메소드
    func instanceMethod(){
        print("Instance Method!")
    }
    //추가 및 변경!
    //재정의 불가 타입 메소드 - static
    static func typeMethod(){
        print("Type Method - static!")
    }
    //재정의 가능 타입 메소드 - class
    class func classMethod(){
        print("Class Method - class!")
    }
}



/*
 열거형 - 자주쓰이므로 확실하게 알아두자/ 다른 언어들의 열거형보다 쓰임새가 좋다.
 - enum 타입이며 각각의 case는 소문자로 사용하고 고유값을 가짐
 - 값을 순서대로 (Int의 경우 값이 없다면 1씩 증가시킨다)
 ex)
 enum 이름{
 case 이름1
 case 이름2
 case 이름3,이름4
 ...
 }
 */
//요일을 예로 들어보자.
enum Weekday{
    case mon
    case tue
    case wed
    case thu, fri, sat, sun //한번에 열거가능
}
var day: Weekday = Weekday.mon // enum은 타입이므로 반드시 사용하자!
day = .tue
print(day)

//케이스를 전부 구현하면 디폴트 구현하지 않아도 된다.
switch day {
case .mon, .tue, .wed, .thu:
    print("평일!")
case .fri:
    print("불금 파티!")
case .sat, .sun:
    print("신나는 주말!")
}

//원시값 - rawValue를 사용하면 되고, case별로 각각 다른 값을 가져야함.
enum Fruit: Int{
    case apple = 0
    case grape = 1
    case peach = 2
}
print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")

//열거형에 메소드도 추가가 가능하다!
enum Month{
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self {
        case .mar,.apr,.may:
            print("봄!")
        case .jun,.jul,.aug:
            print("여름!")
        case .sep,.oct,.nov:
            print("가을!")
        case .dec,.jan,.feb:
            print("겨울!")
        }
    }
}
Month.mar.printMessage()



/*
 값타입과 참조타입
 클래스 - 전통적인 OOP관점에서의 클래스
      - 단일상속 ( 다중상속 불가능! )
      - (인스턴트/타입)메소드
      - (인스턴트/타입)프로퍼티
      - 참조타입
      - Apple 프레임워크의 대부분의 큰 뼈대는 모두 클래스로 작성되어있음!
 
 구조체 - 상속불가이며 값타입
      - 스위프트의 대부분의 큰 뼈대는 대부분 구조체
 
 Enum(열거형) - 다른 언어의 열거형과는 다른 존재라고 봐도 좋다.
            - 상속 불가
            - 값타입이며 자체가 하나의 데이터 타입
            - 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정리
              ex) 요일, 상태값, 월 등등
 
 구조체를 사용하는 때
 - 참조가 아닌 복사를 원할 때
 - 상속받을 필요가 없을 때
 
 값타입 vs 참조타입
 값을 복사 <-> 주소를 복사
 */



/*
 클로저 - 코드의 블럭
 일급 시민
 변수, 상수 등으로 저장이 가능하며 전달인자로 전달이 가능하다.
 함수 : 이름이 있는 클로저
 사용법 :
  { (매개변수 목록)->반환타입 in
    [실행 코드]
 }
 */
//함수를 사용한다면
func sumFunc(a:Int, b:Int) -> Int{
    return a+b
}
var sumResult: Int = sumFunc(a: 1, b: 2)
print(sumResult)

//클로저를 사용한다면
var sum: (Int,Int)->Int = { (a: Int, b : Int) in
    return a+b
}
sumResult = sum(sumFunc(a: 3, b: 4),2)

//전달인자로서의 클로저
//더하기 클로저
let add: (Int,Int)->Int
add = {(a:Int,b:Int)->Int in
    return a+b
}
//빼기 클로저
let substract: (Int,Int)->Int
substract = { (a: Int, b: Int)-> Int in
    return a - b
}
//나누기 클로저
let divide: (Int, Int) -> Int
divide = {(a: Int, b: Int)-> Int in
    return a / b
}
//게산함수 -> 매개변수로 클로저를 넘겨준다!
func calculate(a: Int, b: Int, method: (Int,Int)->Int)->Int{
    return method(a,b)
}
var calculated : Int
//더하기 클로저 활용
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)
//빼기 클로저 활용
calculated = calculate(a: 50, b: 10, method: substract)
print(calculated)
//나누기 클로저 활용
calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)
//곱하기 클로저 활용 - 매개변수에 바로 적용하는 클로저
calculated = calculate(a: 50, b: 10, method: {(left:Int, right: Int)-> Int in
    return left*right
})
