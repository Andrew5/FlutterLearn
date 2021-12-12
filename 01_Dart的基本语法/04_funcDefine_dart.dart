void main(List<String> args) {
  print(sum(20, 1));
}

//面相对象的语言中：类(对象)是第一公民(对象作为参数-返回值)
sum(int num1, num2) {
  return num1 + num2;
}
