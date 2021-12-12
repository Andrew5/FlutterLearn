void main(List<String> args) {
  print("Hello World");
  //变量类型 变量名称 = 赋值;
  //1.明确的声明
  String name = "dhd";
  //类型推导（var/final/const）
  var age = 20;

  final height = 1.88;

  const address = 12;

  //区别
  // const必须赋值常量（编译期间需要有一个确定的值）
  // final 可以通过计算函数获取（运行期间确定一个值）

  final date2 = DateTime.now();
  print(date2);
  //p1个p2是不是同一个对象
  // final p1 = Person("why");
  // final p2 = Person("why");
  // print(identical(p1, p2));

  const p1 = const Person("why");
  const p2 = const Person("why");
  print(identical(p1, p2));

  final name2 = getName(); // 正确的做法
  print(name2);

  // const是不可以赋值为DateTime.now()
  // final一旦被赋值后就有确定的结果, 不会再次赋值
  // const time = DateTime.now(); // 错误的赋值方式
  final time = DateTime.now();
  print(time); // 2019-04-05 09:02:54.052626
}

class Person {
  final String name;
  //初始化列表
  //const放在赋值语句的右边，可以共享对象，提高性能:
  const Person(this.name);
}

String getName() {
  return 'coderwhy';
}
