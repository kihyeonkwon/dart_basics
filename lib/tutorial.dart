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
