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

main() {
  return factoryPattern();
}
