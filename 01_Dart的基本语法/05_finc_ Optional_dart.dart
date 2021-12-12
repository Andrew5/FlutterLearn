void main(List<String> args) {
  //dart 没有函数重载
  //函数可选参数
  sayHello1("zhang");
  sayHello2("lilei", 18, 1.99); //参数位置不可调整
  sayHello3("xiaofang", age: 16); //可选参数 参数顺序不固定
}

//必选参数
void sayHello1(String name) {
  print(name);
}

//可选参数 只有可选参数 才有参数默认值
//位置 实参和形参在进行匹配的时候，是根据位置匹配的
void sayHello2(String name, [int age = 1, double height = 1.0]) {
  print("姓名是 $name, 年龄 $age, 身高 $height");
}

//命名可选参数
void sayHello3(String name, {int age = 1, double height = 1.0}) {
  print("姓名是 $name, 年龄 $age, 身高 $height");
}
