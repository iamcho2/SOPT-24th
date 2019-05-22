# 4차세미나

## 문법 보충 세미나

### 함수

```swift
func 함수명(매개변수) -> 반환 타입 {
  실행 내용
  
  return 반환값
}
```

* 반환 타입 자료형에는 제약 없음
  * 기본 자료형  ( String, Int, Double, Bool … )
  * 클래스 객체 ( AnyObject, UITableCell )
  * 사용자가 정의한 커스텀 클래스 및 구조체
* nil을 반환하려면 함수의 반환 타입이 반드시 옵셔널 타입으로 정의되어 있어야 함



### 함수, 내부 매개변수와 외부 매개변수

```swift
func 함수 이름(<외부 매개변수명> <내부 매개변수명>: <타입>)

//ex
// 함수 정의
func printHello(to name:String, welcomeMessage msg: String){
  print("\(name)님, \(msg)")
}

//함수 호출
printHello(to: "홍길동", welcomeMessage:"안녕하세요")

//출력결과
홍길동님, 안녕하세요
```

* 내, 외부 매개변수를 분리하지만 외부 매개변수명을 사용하지는 않을 때 
  * 함수 정의 시<외부 매개변수명>을 `_`로 작성



### 함수, 기본값을 가지는 매개변수

```swift
func 함수 이름(<매개변수명>: <매개변수 타입> = <기본값>)

//ex
//함수 정의
func printHello(name: String, msg: String = "안녕하세요"){
  print("\(name)님, \(msg)")
}

//함수 호출
printHello(name: "홍길동")
printHello(name: "홍길동", msg: "안녕하세요")

//출력결과
홍길동님, 안녕하세요
홍길동님, 안녕하세요
```



### 함수, 매개상수

```swift
func incrementBy(base: Int) -> Int{
  base += 1
  return base
}

// 에러메시지
: ~~ 'base'는 상수로 정의되었으므로 왼쪽 수정 연산자가 값을 변경할 수 없다.

//해결법
func incrementBy(base: Int) -> Int{
  var base = base //원본은 변하지 않음
  base += 1
  return base
}
```



### 함수, inout , 포인터

```swift
func foo(paramCount: inout Int) -> Int{
  paramCount += 1
  return paramCount
}

var count = 30
print(foo(paramCount: &count)) //함수 내부의 paramCount 변수값 : 31
print(count) //외부에서 정의된 count 변수값: 31
```



### Swift의 함수, defer

```swift
defer {
  
}
```



* defer 블록 : 함수나 메소드에서 코드의 흐름과 상관없이 가장 마지막에 실행되는 블록
* 지연 블록이라고도 부름
* 이 블록에 작성된 구문은 위치와 상관 없이 항상 함수의 종료 직전에 실행됨
* 종료 시점에 맞추어 처리해야 할 구문이 있다면 개발자는 어디에 작성해야 할지 고민하지 않고 defer 블록에 넣어두기만 하면 됨
* 실제로 이 블록은 함수에서 사용된 각종 리소스의 처리나 해제, 연결 종료 등의 구문을 처리하는 용도로 유용하게 사용됨



#### defer 구문의 특성

1. defer 블록은 작성된 위치와 순서에 상관없이 함수가 종료되기 전에 실행됨
2. defer 블록을 읽기 전에 함수의 실행이 종료될 경우 defer 블록은 실행되지 않음
3. 하나의 함수나 메소드 내에서  defer 블록을 여러 번 사용할 수 있음.
   * 이때에는 가장 마지막에 작성된  defer 블록부터 역순으로 실행
4. defer 블록을 중첩해서 사용 가능.
   * 이때에는 바깥쪽 defer 블록부터 실행되며 가장 안쪽에 있는 defer 블록은 가장 마지막에 실행됨



```swift
func successThrough() {
  print("성공")
}

func failThrough(){
  print("실패")
}

func divide(base: Int, success sCallback: () -> void, fail fCallBack: () -> void) -> Int {
  
  guard base != 0 else {
    fCallBack()
    
    return 0
  }
  
  defer{
    sCallBack()
  }
  
  return 100 / base
}

divide(base:30, success: successThrough, fail: failThrough)
```



### 함수, 익명 함수

```swift
divide(base: 30, success{
  () -> void in 
  print("성공")
}, fail: {
  () -> void in
  print("실패")
})
```

* 인자값으로 사용하기 위해 매번 새로운 성공/실패 함수를 작성하는 건 번거로움
* 익명 함수
  * 일회용 함수
    * 간편한 작성 형식을 따름
  * 함수의 형태를 가지지만 이름이 부여되지 않음



### 함수, 클로저 표현식과 경량 문법

```swift
var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
  if s1  > s2 {
    return true
  }else{
    return false
  }
}

value.sort(by: order)
```

* 클로저 표현식은 주로 인자값으로 사용되는 객체임
  * 간결성 극대화를 위해 생략할 수 있는 구문들로 이루어져 있음
  * 필요에 따라 여러 부분 생략 가능



위 코드를 클로저 표현식으로 나타내면

```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {
  (s1: Int, s2: Int) -> Bool in
  if s1  > s2 {
    return true
  }else{
    return false
  }
})

// int 타입의 인자값 두 개를 입력받고, Bool 타입 반환
```



더 간결하게

```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {
  (s1: Int, s2: Int) -> Bool in
  return s1 > s2
})
```



```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {
  (s1: Int, s2:Int) in
  return s1 > s2
})
```

* 클로저 표현식은 **반환값의 타입 생략 가능**

  - 컴파일러는 클로저 표현식의 구문을 해석하여 반환값을 찾고, 그 값의 타입을 추론하여 클로저의 반환 타입을 정의함
* `-> Bool` 이라는 반환값 표현이 생략된 형태



더 더 간결하게

```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {
  s1, s2 in
  return s1 > s2
})
```

* **매개변수의 타입 정의 부분도 생략 가능**
  * 생략된 매개변수의 타입은 컴파일러가 실제로 대입되는 값을 기반으로 추론해냄
  * 타입 어노테이션이 생략되면서 매개변수를 감싸는 괄호도 함께 생략
    * 키워드 `in`을 기준으로 **매개변수 정의** , **매개변수 실행** 두 부분으로만 구성됨



더 더 더 간결하게

```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {return $0 > $1 })
```

* **매개변수도 생략 가능**
  * 매개변수명 대신 `$0`, `$1`, … 같은 이름으로 할당된 내부 상수를 이용할 수 있음
  * 값은 입력 받은 인자값의 순서대로 매칭됨
  * 매개변수가 생략되었으므로 실행 구문만 남았는데, `in` 키워드로 분리할 필요가 없으므로 `in`도 생략



더 더 더 더 간결하게

```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {$0 > $1})
```

* return 도 생략



### 함수, 트레일링 클로저

```swift
var value = [1, 9, 5, 7, 3, 2]

value.sort(by: {
  s1, s2 in
  return s1 > s2
})

에서

value.sort() { (s1, s2) in
    return s1 > s2
}
```

* 외관상 크게 달라진 점은 없음
* 인자값으로 사용되던 클로저가 통째로 바깥으로 빼내어진 다음, sort() 메소드의 뒤쪽에 달라붙음
* 코딩 과정에서 sort() 함수를 열고 닫는 범위가 줄어든다는 명확한 이점



```swift
 value.sort{ (s1, s2) in
    return s1 > s2
}
```

* sort 메소드 뒤의 괄호 사라짐
* 더 필요한 인자값도 없고, 트레일링 클로저 문법 덕분에 호출 구문이라는 점을 명확히 할 수 있으므로 굳이 괄호를 써야 할 필요성 X
* 인자값이 하나일 때에는 마지막 인자값과, 인자값을 넣어주기 위한 괄호 부분도 생략 가능



### @escaping

: 인자값으로 전달된 클로저를 저장해 두었다가, 나중에 다른 곳에서도 실행할 수 있도록 허용해주는 속성

```swift
func callBack(fn: () -> Void){
  fn()
}

callBack{
  print("Closure가 실행되었습니다.")
}
```



```swift
func callBack(fn: () -> Void){
  let f = fn //Non-escaping parameter 'fn' may only be called
  f()
}

callBack {
  print("Closure가 실행되었습니다.")
}
```

* 전달된 클로저를 변수에 대입한 후에 실행하도록 하는 과정을 추가하면 위와 같은 오류가 발생함
  * Non-escaping 파라미터인 `fn` 은 직접 호출하는 것만 가능하다는 것
  * **함수 내에서 직접 실행을 위해서만** 사용해야 함!



```swift
func callBack(fn: @escaping () -> Void){
  let f = fn
  f()
}
```

* 클로저를 변수나 상수에 대입하거나 중첩 함수 내부에서 사용해야 할 경우
  * 이 때 *@escaping* 어노테이션 사용!
  * 이 속성을 클로저에 붙여주면 탈출이 가능한 인자값으로 설정됨

28쪽부터

