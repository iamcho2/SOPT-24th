# 보충세미나

### playground

* swift는 컴파일 언어지만 Playground에서 마치 스크립트 언어처럼 사용할 수 있음
* 결과까지 바로바로 확인 가능 —>  코드 테스트용으로 좋음 (모든 기능을 사용할 수 있지는 X)
* 백준 등 알고리즘 문제 풀 때에도 Playground 쓰면 됨



### swift 기본 문법

> 기본 문법 정리된 파일을 주셔서 그걸 같이 보면서 공부했다
>
> 파일을 올리긴 뭐해서… [여기](https://github.com/iamcho2/Swift-basic) 에 정리해서 올리는 것 참고

* 변수와 상수

* 딕셔너리, 튜플 —> 앱잼에 쓸 일은 별로 없었다.

* 대부분 Swift 4.2로 진행할 것

* Swift의 배열

  * 리스트로 구현되어있어서 중간에 하나 빼도 앞으로 자동으로 땡겨짐 
  * 연결리스트로 구현 안해도 됨

* 옵셔널 Optional

  * Swift의 처음이자 끝!

  * null == nil, optional —> 이 값은 nil이 들어갈 수 있으니 조심해!

  * Optional 해제 방법

    * 강제 해제 : 느낌표(!) 붙이기.

      ```swift
      var opInt1:Int? = 123
      let opForced = opInt1!
      // 이 방법은 때때로 위험할 수 있음
      ```

    * 비강제 해제 : 옵셔널 바인딩

      ```swift
      //1번
      print("\(opInt1)")
      
      //2번
      if let item = opInt2 {
          print("\(item)")
      } else {
          print("실패했습니다.")
      }
      
      //3번
      //위의 방법은 우선 안에 들어가서 하는건데 guard let으로 하면 조건문 안으로 안 들어감
      guard let item = opInt2{ 
          print("\(item)")
      }
      
      //4번
      // ??기호를 써도 됨
      ```

      

#### 추가로

* 구글에 **야곰의 블로그**
* swift documentation
* zeddios.tistory.com



# 본 세미나

### xcode 둘러보기

* Navigator Area
* Editor Area
* Inspector Area
  * File Inspector Tab
    * 선택된 파일에 대한 정보
    * 선택된 파일이 storyboard일 때
      * 빌드 대상 iOS 버전
      *  UI 설계에 대한 Auto Layout 옵션 설정
    * 빌드 대상 범위 조절, 여러 화면 크기 대응 앱 제작, 국가별 언어 설정
  * Identity Inspector Tab
    * 객체, 클래스 사이의 연결
    * 각종 객체의 고유 정보 (ID 등) 관리
    * UI 객체를 소스 코드에서 참조하기 위한 식별값 정의
  * Attribute Inspector Tab
    * 현재 Interface Builder에서 선택된 객체의 속성 관리
    * Interface Builder 상의 객체들이 특성에 따라 서로 다른 속성을 가지기 때문에 표시되는 항목이 객체에 따라 달라짐
  * Size Inspector Tab
    * 선택된 객체의 외형에 대한 속성 관리
    * 크기, 위치, 배치 방식 등
  * Connection Inspector Tab
    * Interface Builder와 소스 코드 간의 연결 관계 관리
    * 이 탭이 관리하는 대표적인 연결 정보
      * ViewController 사이의 화면 이동을 처리하는 세그웨이 (Segueway)
      * Storyboard의 객체 속성을 소스 코드가 참조할 때 사용하는 @IBOutlet
      * Button이나 TableCell, GestureView 등에서 발생한 이벤트를 특정 클래스의  Event Handler로 전달해주는 @IBAction
* Debug Area



## xcode project 1 - helloSOPT

* AppDelegate.swift
  * 앱 전체의 생명주기 관리를 위임받은 객체인 AppDelegate를 구현한 클래스
  * 앱 전체에 적용해야 할 기능을 담당하는 클래스
  * 앱잼에서 쓸 일은 거의 없긴 하다 그래두 나중에 쓸 일이 생길수도
* Label, Button 등을 끌어올 때 alt 키를 누르고 끌어오면 창이 꺼지지 않음
* present modally
  * 새로운 화면이 원래 화면을 덮어쓰는 것. 메모리에는 1,2번 화면이 다 올라가 있음.
  * depth가 쌓일수록 메모리 많이 차지함

* 코드컨벤션 : swift lint 라는 라이브러리 사용해서 협업시 사용 가능
* 라벨 등을 클릭한 후에 이미지나 텍스트가 바뀌어야 할 때에는 액션으로 연결
* 세그웨이 (Segue)
  * 화면 전환 방법 중 한 가지
  * 스토리보드를 통해 출발지와 목적지를 직접 지정하는 장식 = Segue를 이용한 화면 전환
  * 두개의 뷰 컨트롤러 사이에 연결된 화면 전환 객체를 **세그웨이** 라고 함



### 뷰 간의 데이터 전달

여러가지 방법이 있음

* 데이터를 영원히 가지고 있을 필요가 없을 때

  * 직접전달방식 사용
  * 데이터를 넘길 때 그 다음 화면이 나오기 전에 이미 데이터는 넘어가 있음
    * 값이 누락될 걱정 X
  * 다른 곳을 거쳐서 오는 것 보다는 간결한 방법 (소스코드도 간결)

  

* 지속적으로 값을 저장할 필요가 있을 때

  * 저장소를 만들어 두고 값을 가져오는 방법 (ex : 데이터베이스)
  * 그때그때 변하는 값을 보여줄 수 있음
  * 저장되는 시점과 전환되는 시점이 다르면 잠깐 안보이다가 보이는 시간이 존재할 수 
  * 값을 전달받지 못하는 경우가 생길 수 있으므로 (네트워크 문제 등) 그에 대한 처리 필요
  * 소스코드도 길어짐

  

* **View Controller에 직접 값을 전달하는 절차**

  * VC1에서는 VC2로 전달할 값을 준비

  * VC2에서는 값을 대입 받을 프로퍼티를 정의함

    ```swift
    		var paramEmail: String = ""
        var paramUpdate: Bool = false
        var paramInterval: Double = 0
    ```

    

  * VC1에서는 VC2의 인스턴스를 직접 생성하거나, 이미 생성되어 있는 인스턴스의 참조를 읽어옴

    ```swift
    guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else{
                return
            }
    ```

  > "RVC" —> 데이터를 전달받은 뷰 컨트롤러의 Storyboard ID

  

  * VC1에서는 2번째 과정에서 정의한 VC2 인스턴스의 프로퍼티에 값을 대입함

    ```swift
            rvc.paramEmail = self.emailTextField.text!
            rvc.paramUpdate = self.isUpdate.isOn
            rvc.paramInterval = self.interval.value
    ```

  *  VC1에서 VC2로 화면을 전환

    ```swift
    self.present(rvc, animated: true)
    ```



####  dismiss

```swift
@IBAction func onBack(_ sender: Any){
  self.dismiss(animated: true)
}
```



### sender

* 개별 타입을 선택해야 할 때

  ```swift
  @IBAction func onSwitch (_ sender: UISwitch) {
    if(sender.isOn == true){
      self.isUpdateText.text = "갱신함"
    }else{
      self.isUpdateText.text = "갱신하지 않음"
    }
  }
  ```

  * 액션 메소드를 호출한 컨트롤의 속성값이 필요하거나, 이를 제어해야 할 때



* Any 타입을 선택해야 할 때

  ```swift
  #IBAction func onStepper(_ sender: Any) {...}
  ```

  * 서로 다른 타입의 컨트롤이 동일한 액션 메소드를 호출하게끔 처리하고 싶을 때
  * 액션 메소드를 호출한 컨트롤의 정보가 필요 없을 때
  * 개별 타입을 반드시 사용해야 하는 경우를 제외한 나머지 모든 경우
    

* Any로 타입을 지정한 다음에 캐스팅해서 사용하는 방법

  ```swift
  @IBAction func onSwitch(_ sender: Any){
    gurad let obj = sender as? UISwitch else {
      return
    }
    
    if(obj.isOn == true){
      self.isUpdateText.text = "갱신함"
    }else{
      self.isUpdateText.text = "갱신하지 않음"
    }
  }
  ```

  > 옵셔널 캐스팅

  

  ```swift
  @IBAction func onSwitch(_ sender: Any){
    let obj = sender as! UISwitch
    
    if(obj.isOn == true){
      self.isUpdateText.text = "갱신함"
    }else{
      self.isUpdateText.text = "갱신하지 않음"
    }
  }
  ```

  > 강제 캐스팅



### keyboard 설정

keyboard type을 설정해주면 예외처리가 줄어들어서 편하다!



### UIKit

* UIKit 안에는 화면에 표시할 수 있는 것 전부가 들어있음. UILabel 이런게 다 들어있음

* ResultViewController라는 우리의 클래스가 UIviewController라는 클래스를 상속받고 있다

* override func는 보충자료 참고할 것 (pdf 맨 뒤)

* super.viewDidLoad() 
  * 뷰디드로드 가지고있는걸 내가 다 모든걸 가져올게 라고 하는 것
  * (객체지향언어해보신분은 아시겠죠?)



## xcode project 2 - navigation bar

* 네비게이션 바 추가하기
  * 상단바에 Editor - Embed In - Navigation controller

```swift
 @IBAction func presentBtn(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "VC2") as? VC2
            else{
                return
        }
        
        self.present(dvc, animated: true)
    
    }

/////////////////////////////////////////////////
    
    @IBAction func showBtn(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "VC2") as? VC2 else{
            return
        }
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}
```