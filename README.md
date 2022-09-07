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
