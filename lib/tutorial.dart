import 'dart:isolate';

int calculate() {
  return 6 * 7;
}

int get() {
  return 100;
}

int finalVsConst() {
  final int myNumber = get();

  // 아래는 불가능하다. const는 컴파일 시점에 결정되야하기 때문!
  // const int myNumber = get();

  return myNumber;
}

// anonymous function
var multi = (a, b) {
  return a * b;
};

// lambda
sub(a, b) => a - b;

// factory pattern

class Person {
  Person.init();

  factory Person(String type) {
    switch (type) {
      case 'Student':
        return Student();
      case 'Employee':
        return Employee();
      default:
        return Person.init();
    }
  }

  String getType() {
    return 'Person';
  }
}

class Student extends Person {
  Student() : super.init();

  @override
  String getType() {
    return 'Student';
  }
}

class Employee extends Person {
  Employee() : super.init();

  @override
  String getType() {
    return 'Employee';
  }
}

factoryPattern() {
  Person student = Person('Student');
  Person employee = Person('Employee');

  print('type=${student.getType()}');
  print('type=${employee.getType()}');
}

//제너릭 메소드

class GenericPerson {
  T getName<T>(T param) {
    return param;
  }
}

genericMethod() {
  var person = GenericPerson();
  return person.getName<String>('Kim');
}

// isolate

isolateTest(var m) {
  print('isolate no.$m');
}

void isolateMain() {
  Isolate.spawn(isolateTest, 1);
  Isolate.spawn(isolateTest, 2);
  Isolate.spawn(isolateTest, 3);
}

void isolateMain2() {
  int counter = 0;
  ReceivePort mainReceivePort = ReceivePort();

  mainReceivePort.listen((fooSendPort) {
    if (fooSendPort is SendPort) {
      fooSendPort.send(counter++);
    } else {
      print(fooSendPort);
    }
  });

  for (var i = 0; i < 5; i++) {
    Isolate.spawn(foo, mainReceivePort.sendPort);
  }
}

foo(SendPort mainSendPort) {
  ReceivePort fooReceivePort = ReceivePort();
  mainSendPort.send(fooReceivePort.sendPort);

  fooReceivePort.listen((message) {
    mainSendPort.send('received:$message');
  });
}

main() {
  return isolateMain2();
}
