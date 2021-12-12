void main(List<String> args) {
  //列表list
  var names = ["abc", "bcd", "cde", "def"];
  names.add("efg");
  names.removeLast();
  print("最终数组为 $names");

  List<int> numbers = [1, 2, 3, 4];
  print("$numbers 是 ${numbers.runtimeType}");
  var arr = const ["常量", "不可再运行时更改"];
  print("$arr 是 ${arr.runtimeType}");

  //集合SET 无序 元素不重复
  // 1.使用类型推导定义
  var lettersSet = {'a', 'b', 'c', 'd'};
  print('$lettersSet ${lettersSet.runtimeType}');
  // 2.明确指定类型
  Set<int> numbersSet = {1, 2, 3, 4};
  print('$numbersSet ${numbersSet.runtimeType}');
  // 3.去重
  var movies = ["aaa", "bbb", "ccc", "aaa"];
  movies = Set<String>.from(movies).toList();
  print("去重后的集合 $movies");
  //亦或
  List movies2 = ["aaa", "bbb", "ccc", "aaa"];
  movies2 = Set.from(movies2).toList();
  print("去重后的集合 $movies2");

  //映射map
  var info = {"name": "1", "age": 18};
  print("最终字典为 $info");

  Map<String, Object> infoMap2 = {"name": "1", "age": 18, "address": "北京市"};
  print("最终字典为 $infoMap2，${infoMap2.runtimeType}");
}
