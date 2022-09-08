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
