# Dart Introduction

- 객체 지향 : 모든 변수는 객체, 모든 객체는 클래스의 인스턴스
- 선택적 타입 : dynamic이라는 키워드를 쓰면 변수가 타입변경이 가능하다. var일 경우 타입이 변경 불가. 제너릭타입 지원.
- debug mode에서는 dartdevc 컴파일러를, release modedptjsms dart2js 컴파일러를 사용한다.
- 메모리를 공유하는 thread 대신 독립 메모리를 갖는 isolate 사용
- 자바스크립트와 호환

# Dart Project Structure

- bin/tutorial.dart 에서 lib/tutorial.dart를 import해서 사용한다.
- bin/tutorial.dart가 main 함수를 시작하기 위한 엔트리포인트가 된다.

# Keyword

- 식별자 : 변수, 함수 등의 이름.
- 내장 식별자 : 다트가 이미 사용하고 있는 이름으로 사용불가능하다.
- 키워드 : 특정 문맥에서 사용되므로 그곳이 아니면 사용 가능하다. (sync, async, hide, on, show)
- 예약어 : 식별자로 사용할 수 없는 특별한 단어. 내장 식별자와의 차이는 문법적인 의미로 사용되는 것들이 많다.

# 주석, 변수, 상수, 타입

## 주석

- // : 한줄 주석
- /_ ~~~ /_ 사이 모든 내용 주석

## 변수

- num : int와 double의 supertype
- int
- double : 보통 int->double로의 형변환이 가능하지만 다트에서는 안된다. int, double -> num은 가능하다.
- string
- boo
- var : 타입 미지정. 초깃값을 참고하여 타입 추론. 타입 변경이 불가능하다. 초보자는 쓰지 말자.
- dynamic
- list
- set : 순서가 없고 중복가능한 collection
- map : key, value를 가지는 collection

## 상수

- 값을 바꿀 수 없는 변수
- final : 런타임에 상수가 되고
- const : 컴파일 시점에 상수가 된다.

# 함수

- 모든것이 객체고 함수도 객체다.
- 변수가 함수를 참조할 수 있다.
  `var name = getName(){return 'myName'}`
- 함수의 인자로 함수를 전달할 수 있다.
  `getName(getFirstName(), getLastName())`
- optional parameter 지원한다.
- anonymous function과 lambda expression을 지원한다.
  - lambda 또는 closure라고 부른다.
  - 익명 함수 : `(a, b){a + b}`
  - 람다 함수 : `(a, b)=>a +b`

# 연산자

## 산술 연산자

- ~/ 가 특이한데 파이선 `//`로 몫을 구하는 연산자다.

## 할당 연산자

- 특별한것은 없다.

## 관계 연산자

- 특별할것은 없다.

## 비트 연산자

- 사용할 일이 거의없고 특별할 것은 없다.
- &, |, ^, ~, <<, >>

## 타입 검사 연산자

- as : 형변환
  - 상위 타입으로만 형변환 가능하다.
- is : 특정 타입이면 true
  - 상위 타입이여도 true
- is! : 특정 타입이 아니면 true

## 조건 표현식

- ternary operator : `조건? 표현식1 : 표현식2`
- conditional member access : `employee?.name` employee가 없으면 null을 리턴
- null check : `employee.name ?? 'new name'` employee가 없으면 'new name'을 리턴

## 케스케이드 표기법

```
Employee employee = Employee()
..name = "Kim"
..setAge(25)
..showInfo();

//아래와 동일하다
Employee employee = Employee()
employee.name = "Kim";
employee.setAge(25);
employee.showInfo();
```

## 조건문

- if, if else, switch case 는 동일하다.
- assert : 조건식이 거짓이면 에러 발생. debug mode에서만 동작한다.

## 반복문

- for, while, do~while

# 클래스

# 생성자

- Default consturctor : 클래스명과 동일하고 부모 클래스의 기본 생성자를 호출한다. 이는 상속되지는 않는다.
- Named constructor : 한 클래스 내에 많은 생성자가 있는 경우. named constructor를 만들경우 기본생성자를 생략 불가능.

```
class Person{
    Person(){
        print('기본 생성자');
    }

    Person.init(){
        print('named constructor');
    }
}
```

- Initializer list : 생성자의 구현부가 실행되기 전에 인스턴스의 변수를 초기화 할 수 있다.

```
class Person {
    String name;
    Person() : name = 'Kwon'{
        print('This is $name initialized constructor);
    }
}
```

- Redirecting constructor : 초기화리스트를 응용해서 이름생성자의 본체는 비우고 메인 생성자에게 위임할 수 있다.

```
class Person{
    String name;
    int age;

    Person(this.name, this.age){
        print('$name, $age 의 consturctor');
    }


    Person.initName(String name):this(name, 20);
    Person.initAge(int age):this('홍길동', age)
}
```

- Constant constructor : 클래스가 변하지 않는 객체를 생성한다. 인스턴스 변수가 모두 final. 생성자는 const

```
class Person {
    final String name;
    final num age;

    const Person(this.name, this.age);
}

main(){
    //상수 생성자로
    Person person1 = const Person('Kwon', 30);
    Person person2 = const Person('Kwon', 30);
    //일반 생성자로
    Person person3 = new Person('Kwon', 30);
    Person person4 = new Person('Kwon', 30);
    //상수 생성자로 만든 인스턴스들은 다 하나의 메모리에 저장돼있는 상수인스턴스를 가르키고 있다.
    //person1과 person2는 identical, 1-3, 3-4는 not identical
}
```

- Factory constructor : factory 패턴이 적용.

```
// create Class Car
class Car {
    //class properties
    String name;
    String color;

    //constructor
    Car({ this.name, this.color});

    // factory constructor that returns a new instance
    factory Car.fromJson(Map json) {
    return Car(name : json['name'],
    color : json['color']);
    }
}

void main(){
    // create a map
    Map myCar = {'name': 'Mercedes-Benz', 'color': 'blue'};
    // assign to Car instance
    Car car = Car.fromJson(myCar);
    //display result
    print(car.name);
    print(car.color);
}
```

# 접근 지정자

객체 지향의 4대 특징

1. 추상화 - 객체의 공통 데이터와 메서드를 묶어서 이름을 부여하는 것. 단순히 말해 클래스를 만드는 일. 유의미한 데이터들만 남기고 나머지는 복잡도를 줄이기 위해 숨기는 과정.
1. 캡슐화 - 접근지정자와 관련. 객체가 목적을 수행하기 위한 데이터와 기능, 즉 멤버 변수와 메서드를 적절하게 모으는 것.
1. 상속
1. 다형성

- private : 접근 범위는 동일 클래스가 아닌 라이브러리이다. 언더바를 통해서 지정할 수 있다.
- public : 다 가능

# getter & setter

- 여러 곳에서 참조하고 있을때 잘못변경되지 않도록 정보 은닉화를 해줘야 한다.

```
class Person{
    String _name;
    String get name => _name;
    //변경에 대한 제어가 어느정도 가능하다.
    set name(String name) =>(name == null) ? _name = 'Park : _name= name;;
}

# 추상화

```

abstract class Person{
eat();
}

abstract class Junior{
work(){
print('work hard');
}
}

class Developer implements Person, Junior{
@override
eat(){
print("dev eating a meal);
}

    work(){
        print('working hard~');
    }

}

# 컬렉션

다수의 데이터를 처리가능. 데이터의집합이기 때문에 반복가능(iterable).

- List : 순서 있고 중복 가능
- Set : 순서 없고 중복 불가
- Dict : K:V, 키는 중복 불가

# 제너릭

- 제너릭은 타입 매개변수를 통해 다양한 타입에 대한 유연한 대처를 가능케 한다?
- 타입 매개변수는 인자 값 대신에 타입을 전달한다.

```
abstract class List<E> implements EfficientLengthIterable<E>{
    void add(E value);
}


List<String> colors = List();
colors.add('Red');
```

- 아직 타입을 지정하지 않은 상태로 클래스를 만들고 그 뒤에 지정해줄 수 있다.
- 이로써 코드를 중복으로 선언하지 않을 수 있다.
- 매개변수화 타입을 제한할 수도 있다. extends를 사용해서 지정하면 된다. `<T extends Person>`

## 제너릭 메서드

- 제너릭은 클래스뿐만 아니라 메서드에도 사용가능하다. 메서드의 리턴 타입, 매개변수를 제너릭으로 지정 가능하다.

```
class Person{
    T getName<T>(T param){
        return param;
    }
}

void main(){
    var person = Person();
    print(person.getName<String>('Kim));
}
```

# asynchronous programming

- 요청한 작업은 별도의 방식에 맡기고 다음 작업으로 넘어간다.
- 동시성(concurrency)나 병렬(parallel)과는 비교할 수 없는 개념.
- dart는 future과 stream을 통해 비동기를 지원하고 isolate라는 구조를 이해해야한다.

## isolate

- isolate는 다트의 모든 코드가 실행되는 공간. 싱글 스레드와 이벤트 루프를 가지고 있다. main isolate는 런타임에 생성된다.
- 싱글 스레드지만 이벤트루프로 비동기처리를 하고(자바스크립트처럼) 필요하다면 별도의 isolate도 만들수 있다(자바의 스레드처럼).
- 스레드와 차이점은? 스레드는 스레드끼리 메모리를 공유한다(code, data, heap). isolate는 메모리를 공유하지 않는다.
- isolate를 사용하면 공유작업시에 message를 통해서 주고받아야한다. 불편할 수 있지만 공유자원에 대한 컨트롤을 신경쓰지 않아도 되서 좋다.

## future, async, await

- future는 uncompleted -> data, error 로 나뉜다.
- 사용법은 js와 동일하다!

```
myFuture.then((data){
    print(data);
}, onError:(e){
    print(e);
})
```

- stream은 연속 데이터를 listen을 통해 비동기적으로 처리할 수 있다.
- future가 이미지파일 하나용이라면 stream은 동영상에 쓸 수 있다.
- stream은 구독자 패턴. 구독자 listen이 대상 stream을 구독하여 변화가 발생하면 알려준다.

```
main(){
    print('start');
    var stream = Stream.periodic(duration(seconds:1), (x)=>x+1)
    .take(5)
    .listen((x)=>print('periodic:$x));

    Stream.fromIterable(['one', 'two', 'three'])
    .listen((dynamic x)=>print('fromIterable: $x'));

    Stream.fromFuture(getData())
    .listen((x)=> print('fromFuture: $x));
    print('do something');
}

Future<String> getData() async{
    return Future.delayed(Duration(seconds:3), ()=>'after 3 seconds')
}
```

- StreamController : stream에 이벤트 직접 지정
