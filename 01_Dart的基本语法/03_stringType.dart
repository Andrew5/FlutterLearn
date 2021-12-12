// ignore_for_file: unnecessary_brace_in_string_interps

void main(List<String> args) {
  //定义字符串
  var str1 = "s";
  var str2 = 'd';
  var str3 = """
  dsf
  dsf
  """;

  //字符串拼接
  var height = 1.00;
  var age = 12;
  var name = "lilei";
  var message = "拼接结果 ${name} age ${age}  $height";
  //如果 大扩号里是变量:{var} 大括号可以省略
  var valueType = "身高值类型 ${height.runtimeType}，名字值的类型 ${name.runtimeType}";

  print("结果 ${message}");
  print("类型结果是 ${valueType}");

  //如果确实希望这样做,可以使用dynamic来声明变量:
  //但是在开发中, 通常情况下不使用dynamic, 因为类型的变量会带来潜在的危险
  dynamic name2 = 'coderwhy';
  print("结果 $name2 类行为 ${name2.runtimeType}"); // String
  name2 = 18;
  print(name2.runtimeType); // int
  print("结果 $name2 类行为 ${name2.runtimeType}"); // String

  //字符串转数字
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

  //数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String
}
