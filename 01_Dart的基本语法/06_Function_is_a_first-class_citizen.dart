void main(List<String> args) {
  // test(head);
  //函数是一等公民：函数A可以作为另外一个B的参数，也可以作为函数B的返回值
  //匿名函数 （参数列表）{函数体}；
  test(() {
    print("1匿名函数被调用");
    return 10;
  });
  //匿名函数
  AnonymousFunction(() {
    print("2匿名函数被调用");
  });
  //箭头函数 只允许一行 条件，函数体只有一行 场景：简化代码
  ArrowFunction(() => print("箭头函数被调用"));
  /*
  main() => runApp(HomePage());
  class HomePage extends
  */
  //函数是一等公民
  firstcitizen((num1, num2) {
    return num1 + num2;
  });
  //优化有的函数调用
  haha((num1, num2) {
    print("优化后的函数调用");
    return num1 + num2;
  });

  var demo1 = demo();
  print("带有返回值类型的函数 ${demo1(20, 30)}");
}

//下面这种函数阅读性很差
//类似函数封装
void firstcitizen(int haha(int num1, int num2)) {
  haha(20, 30);
}

//函数定义
//优化有的函数调用
typedef Calculate = int Function(int num1, int num2);
void haha(Calculate calc) {
  print("优化后的函数调用");
  calc(20, 30);
}

//函数带有返回值
Calculate demo() {
  //29行代码 demo1指向下面这个函数
  return (num1, num2) {
    //匿名函数
    return num1 * num2;
  };
}

//函数可以作为另外一个函数的参数
void test(Function foo) {
  // foo();
  var result = foo();
  print("什么？");
}

// num getSum(int num1, num2) {
//   return num1 + num2;
// }

void head() {
  print("head函数被调用");
}

//匿名函数
void AnonymousFunction(Function foo) {
  foo();
}

//箭头函数
void ArrowFunction(Function foo) {
  foo();
}
