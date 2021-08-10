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



/*
 클로저 고급
 후행 클로저 / 반환타입의 생략 / 단축 인자이름 / 암시적 반환 표현
 */
//기본적인 더하기 계산 클로저
func calculateMachine(a: Int, b: Int, method: (Int,Int)-> Int)->Int{
    return method(a,b)
}
var result: Int

//후행 클로저 - 클로저가 함수의 마지막 전달인자라면 이를 생략하고 소괄호 외부에 클로저를 구현하는 방법
result = calculateMachine(a: 10, b: 10){(left: Int, right: Int)-> Int in
    return left + right
}
print(result)

//변환타입의 생략 - 위의 함수의 method 매개변수는 Int 타입을 반환할 것이라는 사실을 컴파일러도 읽기 때문에 굳이 클로저에서 반환타입을 명시해 주지 않아도 된다. 대신 in 키워드는 생략할 수 없다.
//즉, calculateMachine의 반환형이 정수형이라는 것을 컴파일러가 알고있기 때문에 반환타입 생략가능.
result = calculateMachine(a: 10, b: 10, method: {(left: Int, right: Int) in
    return left + right
})
//이를 후행 클로저와 함께 사용하면 다음과 같다.
result = calculateMachine(a: 10, b: 10){(left: Int, right: Int) in
    return left + right
}

//단축 인자이름 - 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있다.
result = calculateMachine(a: 10, b: 10, method: {
    return $0+$1
})
//이를 후행 클로저와 함께 사용하면 다음과 같다.
result = calculateMachine(a: 10, b: 10){
    return $0 + $1
}

//암시적 반환 표현 - 클로저가 변환하는 값이 있다면 클로저의 마지막 줄의 결과값은 임시적으로 반환값으로 취급
result = calculateMachine(a: 10, b: 10){
    $0 + $1
}

//클로저의 기본적인 문법과 축약형을 비교해보자.
//기본적인 문법
result = calculateMachine(a: 10, b: 10, method: {(left: Int, right: Int) -> Int in
    return left + right
})
//축약형
result = calculateMachine(a: 10, b: 10) { $0+$1 }



/*
 프로퍼티
 1. 저장 프로퍼티(stored property)
 2. 연산 프로퍼티(computed propety)
 3. 인스턴스 프로퍼티(instance property)
 4. 타입 프로퍼티(type property)
 - 프로퍼티는 구조체, 클래스, 열거형 내부에서 구현 가능
 - 다만, 열거형 내부에서는 연산 프로퍼티로만 사용가능
 - 연산프로퍼티는 반드시 var로 선언 / let 불가능
 */
//학생 구조체로 예시
struct StudentInfo{
    //인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    //인스턴스 연산 프로퍼티
    var westernAge: Int{
        get{
            return koreanAge - 1
        }
        set(inputValue){
            koreanAge = inputValue + 1
        }
    }
    
    //타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    //읽기전용 인스턴스 연산 프로퍼티
    var selfIntroduction: String{
        get{
            return "저는 \(self.name)입니다. 저의 반은 \(self.class)입니다!"
        }
    }
    
    //읽기전용 타입 연산 프로퍼티, 읽기전용에서는 get을 생략가능하다.
    static var selfIntroduction: String{
        return "학생입니다."
    }
}
//(1)타입 연산 프로퍼티 사용
print(StudentInfo.selfIntroduction)

//(2)인스턴스 생성 및 인스턴스 저장 프로퍼티 사용
var goHigh: StudentInfo = StudentInfo()
goHigh.koreanAge = 27
goHigh.name = "9oHigh"

//(3)인스턴스 연산 프로퍼티 사용
print(goHigh.selfIntroduction)

//응용방법에 대해서 알아보자.
struct Money{
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get{
            return dollar * currencyRate
        }
        set{
            //newValue - 매개변수역할
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()
moneyInMyPocket.won = 11000
print(moneyInMyPocket.won)

moneyInMyPocket.dollar = 10
print(moneyInMyPocket.dollar)

/*
 프로퍼티 감시자 - 프로퍼티 값이 변경될 떄 원하는 동작을 수행할 수 있게 해준다.
 */
//예시
struct howYourMoney{
    //프로퍼티 감시자
    var currencyRate: Double = 1100{
        willSet(newRate){
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.")
        }
        didSet(oldRate){
            print("환율이 \(oldRate)에서 \(currencyRate)로 변경되었습니다.")
        }
    }
    var dollar: Double = 0 {
        willSet{
            //willSet의 암시적 매개변수 이름이 newValue
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet{
            //didSet의 암시적 매개변수 이름이 oldValue
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.")
        }
    }
    // 프로퍼티 감시자와 연산 프로퍼티의 기능을 동시에 사용할 수가 없다!!
    var won: Double{
        get{
            return dollar*currencyRate
        }
        set{
            dollar = newValue / currencyRate
        }
        //willSet, didSet 불가능! 저장되는 값이 변경될때 사용하는 것이기 때문이다.
    }
}

//연습
var myMoney = howYourMoney()
myMoney.currencyRate = 1150
myMoney.dollar = 10
//함수, 메소드, 클로저, 타입등에서 모두 사용가능하다.
var a: Int = 100{
    willSet{
        print("\(a)에서 \(newValue)로 변경될 예정입니다.")
    }
    didSet{
        print("\(oldValue)에서 \(a)로 변경되었습니다.")
    }
}
a = 150



/*
 스위프트의 상속 - 클래스, 프로토콜등에서 사용
 - 열거형, 구조체는 상속이 불가능하다.
 - 스위프트는 다중 상속이 불가능
 
 클래스의 상속과 재정의 - 중요! @Overring
 class 이름 : 상속받을 클래스 이름{
 [구현부]
 }
 */

class Person{
    var name: String = ""
    
    func selfIntroduce(){
        print("저의 이름은 \(name)입니다.")
    }
    //파이널 키워드는 재정의 불가능하게 한다.
    final func sayHello(){
        print("Hello!")
    }
    //타입 메소드
    //재정의 불가 타입 메소드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    //재정의 가능 타입 메소드 - class
    //만약 final을 이용한다면 재정의가 불가능하다.
    class func classMethod(){
        print("type method - class")
    }
}
//위의 Person 클래스를 상속받아보자.
class myStudent: Person{
    var major : String = ""
    //재정의
    override func selfIntroduce() {
        print("I'm \(name). My major is \(major).")
    }
    //재정의
    override class func classMethod() {
        print("overriden type method - class")
    }
}



/*
 인스턴스 생성과 소멸
 - 이니셜라이저와 디이니셜라이저
 - init, deinit
 - 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야함.
 - 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨가 동시에 초기값을 지니게 된다.
 - 이니셜라이저는 자바의 생성자와 같다고 생각하면 된다.
 */

class myPerson{
    var name: String
    var age: Int
    //암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할때
    var nickName : String?
    //init 키워드를 활용하여 원하는 초기값으로 설정할 수 있다!
    //편의 이니셜라이즈! 참고용.
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
        //같은 표현 - convenience를 사용하여 같이 사용한다.
        //self.init(name: name,age: age, nickName: nickName)
    }
    //옵셔널을 활용하여 초기입력이 필요없는 값을 처리
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
//이니셜라이저를 활용한 인스턴스 생성
let myFriend :myPerson =  myPerson(name: "Hogu", age: 20, nickName: "NoAnswer")
let myBest : myPerson =  myPerson(name: "Good", age: 20)

//참고용 - 실패가능한 이니셜라이저
//이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우, 인스턴스 생성에 실패할 수 있다.
//따라서 nil을 반환하게 하고 이때 이니셜라이저의 반환타입은 옵셔널 타입이 된다.

class optionalPerson{
    var name : String
    var age : Int
    var nickName: String?
    var newName : String?
    //옵셔널 형태의 이니셜라이저
    init?(name: String, age: Int) {
        if(0...120).contains(age) == false{
            //해당되는 나이가 아니라면 nil을 반환
            return nil
        }
        if name.count == 0{
            return nil
        }
        self.name = name
        self.age = age
    }
    deinit {
        //옵셔널 변수로 해당 deinit이 작동할 때 예기치 못하게 변수에 내용이 없는 경우 ??를 이용하여
        //디폴트 값을 넣어줄 수 있다.
        print("\(name)은 개명을 신청했고, 이름은 \(newName ?? "실수")로 변경되었습니다.")
    }
}
// 옵셔널로 이니셜라이저를 사용할 경우, 선언도 옵셔널로 해야한다.
var myPeople: optionalPerson? = optionalPerson(name: "Jhon", age: 30)
//디이니셜라이저
//deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출되고
//해제되는 시점에 해야하는 것을 구현할 수 있게 한다.
myPeople?.newName = "Donalds"
myPeople = nil



/*
 옵셔널 체이닝과 nil 병합
 - 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로 또다시 옵셔널이 연속으로 연결될 경우 유용하게 사용가능하다.
 */
//다음 예시를 통해 확인해보자.
class whoYouAre{
    var name: String
    var job: String?
    //옵셔널
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}
class Apartment{
    var buildingNumber : String
    var roomNumber: String
    //옵셔널
    var `guard`: whoYouAre?
    var owner: whoYouAre?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}
//옵셔널 부분은 nil이다.
let goingHigh: whoYouAre? = whoYouAre(name: "9oHigh")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: whoYouAre? = whoYouAre(name: "Superman")

//옵셔널 체이닝을 활용하지 않는다면.. 다음과 같은 일이 벌어진다.
func guardJob(owner: whoYouAre?){
    //if let 구문은 옵셔널타입의 변수를 unwrap하기 위해 사용되어진다.
    //즉, 값을 가지고 있다면 변수에 할당하여 {}안의 코드를 실행하고
    //nil이라면 실행하지 않게 된다.
    if let owner = owner{
        if let home = owner.home{
            if let `guard` = home.guard{
                if let guardJob = `guard`.job{
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                }else{
                    print("우리집 경비원은 무직이다.")
                }
            }
        }
    }
}

//옵셔널 체이닝을 사용하자! 굉장히 깔끔해진다.
func guardJobWithOptionalChaining(owner: whoYouAre?){
    if let guardJob = owner?.home?.guard?.job{
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    }else{
        print("우리집 경비원은 무직입니다.")
    }
}

//nil의 병합 연산자, 옵셔널 변수의 값이 nil이면 ?? 뒤의 디폴트 값을 사용하게 된다.
var guardJob: String
guardJob = goingHigh?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)



/*
 타입캐스팅
 - 스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도로 쓰이거나 클래스의 인스턴스를 부모 혹은 자식
 클래스의 타입으로 사용할 수 있는지 확인하는 용도이며 is, as를 사용한다.
 */
//참고
//스위프트는 기존의 것처럼 형변환시 타입캐스팅이 되는 것이 아니라
//someInt의 값을 실수형으로 다시 만드는 것일 뿐이다.
let someInt: Int = 100
let someDouble: Double = Double(someInt)

//타입 캐스팅을 위한 클래스 정의
class NomalPerson{
    var name: String = ""
    func breath(){
        print("숨을 쉬고 있어요.")
    }
}

class NomalStudent : NomalPerson{
    var school : String = ""
    func goToSchool(){
        print("등교를 합니다.")
    }
}

class UniversityStudent: NomalStudent{
    var major: String = ""
    func goToMT(){
        print("MT를 갈거에요!")
    }
}

var jaesuk : NomalPerson = NomalPerson()
var haha: NomalStudent = NomalStudent()
var hongchul : UniversityStudent  = UniversityStudent()

//is 사용방법 - 타입 확인용
var answer: Bool

answer = jaesuk is UniversityStudent
print(answer)

answer = haha is NomalStudent
print(answer)

answer  = hongchul is NomalStudent
print(answer)

//switch 구문을 활용해보자.
switch hongchul {
case is NomalPerson:
    print("홍철이는 사람입니다.")
default:
    print("홍철이는 사람인 것이 전부입니다.")
}

//as 사용법 - 업캐스팅/다운캐스팅을 이용할때 사용한다. 많이 사용하지는 않는다.
//Any 혹은 AnyObject로도 타입정보를 변환 가능하다. -> 암시적으로 처리가 가능하니 생략해도 무방하다.
var mike: NomalPerson = UniversityStudent() as NomalPerson
var jina: Any = NomalPerson()

//다운캐스팅에서의 as는 as? /as!로 사용된다.(조건부/강제)
var optionalCasted: NomalStudent?
optionalCasted = mike as? UniversityStudent

var forcedCasted: NomalStudent
optionalCasted = mike as! UniversityStudent



/*
 assert와 guard
 - 애플리케이션이 동작 도중에 생성하는 다양한 결과값을
 동적으로 확인하고 안전하게 처리할 수 있도록 확인하고 빠르게 처리할 수 있다.
 
 Assertion - assert(_:_:file:line:)함수를 사용하며 디버깅 모드에서만 작동한다.
 배포되는 어플리케이션에서는 제외된다. 조건 검증을 위해 사용된다.
 
 guard - 잘못된 값을 전달할 시에 특정 실행구문을 빠르게 종료할수 있게 해준다.
 guard의 else 블럭 내부에는 반드시 코드블럭을 종료하는 return,break등이 있어야하며
 주로 타입 캐스팅, 옵셔널과 사용된다.
 */
//assert의 사용
var someInteger : Int = 0
assert(someInteger == 0, "someInt != 0")

func functionWithAssert(age: Int?){
    assert(age != nil,"age == nil")
    assert((age!>=0) && (age! <= 130),"나이값을 다시 입력해야 할 것 같네요.")
    print("당신의 나이는 \(age!)입니다.")
}
functionWithAssert(age: 50)

//guard의 사용 - if 문보다 안정성이 높고 축약형식으로 사용가능하다. 참인경우 특정 구현부분이 없다면 guard를 사용해보자.
func functionWithGuard(age: Int?){
    
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else{
        print("나이값 입력을 다시해야 할 것 같습니다.")
        return
    }
    print("당신의 나이는 \(unwrappedAge)입니다.")
}

var count = 1
while true {
    guard count < 3 else{
        break
    }
    print(count)
    count+=1
}

//딕셔너리 값을 가지고 올때 guard가 자주 사용된다.
//딕셔너리에서 가져오는 값은 모두 옵셔널임을 주의하자!
func someFunction(info: [String: Any]){
    //딕셔너리의 "name"키에 해당하는 값을 가져오면서 문자열로 사용하기위해 캐스팅되는지 확인(as? String)
    guard let name = info["name"] as? String else {
        return
    }
    guard  let age = info["age"] as? Int, age >= 0 else {
        return
    }
    print("\(name): \(age)")
}

someFunction(info: ["name":"jenny","age":"10"]) //실행안된다. - age값을 정수형으로 캐스팅 불가능
someFunction(info: ["name":"mike"])             //실행안된다. - age값이 nil
someFunction(info: ["name":"9oHigh", "age": 20])//실행된다. - 정상적으로 캐스팅 및 출력



/*
 프로토콜
 - 특정 역할을 수행하기 위한 메소드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의하는 것
 - 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서 프로토콜의 요구사항을 실제로 구현할 수 있다.
 - 특정한 프로토콜의 요구사항을 모두 따르는 타입은 "프로토콜을 준수한다(Conform)"고 표현
 - 즉, 요구사항을 모두 충족한다는 것은 제시하는 모든 기능을 구현해야하는 것을 말한다.
 
 정의 및 문법
 protocol 이름 {
    [정의부]
 }
 
 결국, java의 interface와 같다고 보면 좋을 것 같다.
 */
//프로토콜 예시
protocol Talkable{
    /*
     프로퍼티 요구는 항상 var키워드를 사용하며
     get은 읽기만 가능해도 상관없음을 의미하고
     get과 set을 모두 명시하면 읽기와 쓰기가 모두 가능한 프로퍼티여야 한다.
     */
    var topic: String{get set}
    var language: String{get }
    // 메소드 요구
    func talk()
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

// ProtocalPerson 구조체에 Talkable 프로토콜 사용하기
struct ProtocalPerson: Talkable{
    //읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능하다.
    var topic: String
    var language: String
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다.")
    }
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

/* 프로토콜의 상속
  - 프로토콜은 클래스와 다르게 다중 상속이 가능하다.
  protocol 프로토콜이름 : 부모 프로토콜의 이름목록{
    [정의부]
 }
*/
//사용 예시
protocol Readable{ func read() }
protocol Writeable { func write() }
protocol ReadSpeakable: Readable{ func speak() }
protocol ReadWriteSpeakable: Readable,Writeable { func speak() }
protocol SomeType: ReadWriteSpeakable {
    func read()
    func write()
    func speak()
}

//클래스에 상속받을 시에 순서가 중요 :  class 이름 : 클래스먼저 , 프로토콜 나중에!



/*
 익스텐션
 - 여러 타입에 새로운 기능을 추가할 수 있는 기능이다.
 - 익스텐션으로 추가할 수 있는 기능
 (1) 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
 (2) 타입 메소드 / 인스턴스 메소드
 (3) 이니셜라이저
 (4) 서브스크립트
 (5) 중첩타입
 (6)) 특정 프로토콜을 준수 할 수 있도록 기능 추가
 다만, 기존에 존재하는 기능을 재정의할 수는 없다.
 
 extension 이름 (: 프로토콜1,프로토콜2... 생략가능)
  [새로운 기능]
 }
 */
// 짝수인지 홀수인지 판별하는 기능 추가 예제
extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isOdd)
print(2.isEven)
print(3.isEven)

//원하는 값만큼 곱하는 메소드 기능을 추가하는 예제
extension Int{
    func multiply(by n: Int) -> Int{
        return self * n
    }
}
print(3.multiply(by: 7))

//이니셜라이저에서의 활용
extension String{
    init(intTypeNumber: Int){
        self = "\(intTypeNumber)"
    }
    init(doubleTypeNumber: Double){
        self = "\(doubleTypeNumber)"
    }
}
let stringFromInt: String = String (intTypeNumber: 100)
let stringFromDouble: String = String(doubleTypeNumber: 23.5)
print(stringFromInt)
print(stringFromDouble)



/*
 오류 처리
 - Error 프로토콜과 (주로) 열거형을 이용해 오류를 표현
 enum 오류종류이름 : Error{
    case 종류1
    case 종류2
    ...
 }
 */
//예시 - 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachineError : Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

// 함수에서 발생한 오류 던지기
// 자판기 동작 도중 발생한 오류를 던지는 과정을 살펴보자.
// throws를 이용하여 오류를 내포하고 있는 함수임을 표시
class VendingMachine{
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    //돈을 받는 메소드
    func receiveMoney(_ money: Int) throws {
        guard money > 0 else{
            throw VendingMachineError.invalidInput
        }
        self.deposited += money
        print("\(money)원이 들어왔습니다. 물건을 선택해 주세요.")
    }
    
    //물건 팔기 메소드 , throws의 반환형태를 정할 수 있음
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String{
        //아이템의 수량이 잘못 입력되었으면 오류를 던짐
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        // 구매하려는 수량보다 넣은 돈이 적으면 오류를 던짐
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded : Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        //구매하려는 수량보다 재고가 적으면 오류를 던짐
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        //오류가 없으면 정상처리
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개의 아이템이 나왔습니다."
    }
}
// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()
// 판매 결과 변수
var res: String?

//do-catch를 사용해보자.
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput{
    print("입력이 잘못되었어요.")
}// catch...
//너무 많은 catch문이 작성될 수 있으며 코드가 어지럽혀진다.

//이럴때는 Switch문을 활용해서 작성하자
do{
    try machine.receiveMoney(300)
}catch{
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    //case ...
    default:
        print("오류처리는 이런 방식으로 합니다.")
    }
}

//try? 와 try!에 대해서 알아보자.
//try?의 경우 오류처리 결과를 통보받지 않고 오류가 발생했을 경우 nil로 반환된다.
//try!의 경우 오류가 발생하지 않을 것이라는 확신이 있을 때 사용하면 정상동작후 바로 결과값을 받는다(강제성). 다만, 오류가 발생할 경우에는 런타임 오류가 발생하여 어플리케이션이 중지된다.
var checkPoint: String?
checkPoint = try? machine.vend(numberOfItems: 2)
print(checkPoint ?? "실수")

checkPoint = try! machine.vend(numberOfItems: 1)
print(checkPoint ?? "실수였음")



/*
고차함수
 - 전달인자로 함수를 전달받거나 함수실행의 결과를 함수로 반환하는 함수를 말한다.
 - map, filter, reduce
 */


// map - 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
let numbers: [Int] = [0,1,2,3,4]
var doubleNumbers : [Int]
var strings: [String]

doubleNumbers = [Int]()
strings = [String]()

//for 문을 활용
for number in numbers{
    doubleNumbers.append(number*2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)

//이를 map을 이용해서 사용해보자.
doubleNumbers = numbers.map({
    (number: Int)-> Int in return number*2
})

strings = numbers.map({
    (number: Int) -> String in return "\(number)"
})
//더욱더 간단한 표현 - 클로저 축약형 활용
doubleNumbers = numbers.map {$0 * 2}


//filter - 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출
var filtered: [Int] = [Int]()

//for문을 이용하면
for number in numbers{
    if number % 2 == 0{
        filtered.append(number)
    }
}
//filter를 사용해보자.
let evenNumbers: [Int] = numbers.filter{
    (number: Int) -> Bool in
    return number % 2 == 0
}


//reduce - 컨테이너 내부의 콘텐츠를 하나로 통합
let someNumbers: [Int] = [2,8,15]
var plusResult: Int = 0
//for문을 사용
for number in someNumbers{
    plusResult += number
}

//reduce를 사용해보자. // 초기값, {클로저}
let sumValues: Int = someNumbers.reduce(0,{
    (first: Int, second: Int)->Int in
    return first + second
})
