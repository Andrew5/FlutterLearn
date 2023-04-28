import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DHHomePage(),
    );
  }
}

class DHHomePage extends StatelessWidget {
  const DHHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品列表"),
      ),
      // body: const DHHomeContent(),
      body: const DHHomeContentSub("你好李焕英！"),
    );
  }
}

// Widget 是不加_：暴露给别人使用
class DHHomeContentSub extends StatefulWidget {
  final String message;
  const DHHomeContentSub(this.message, {super.key});
  // bu
  @override
  State<StatefulWidget> createState() {
    return _DHHomeContentStateSub();
  }
}

/// 为什么Flutter在设计的时候StatefulWidget的build方法放在state中
/// 1.build出来的widge是需要依赖state中的变量(状态/数据)
/// 2.在Flutter的运行过程中：
///   Widget(描述信息)是不断的销毁和创建的，
///   当我们自己的状态改变时，并不希望重新状态一个新的State

/// State 是加_: 状态这个类只是给Widget使用
class _DHHomeContentStateSub extends State<DHHomeContentSub> {
  // bu
  String title = "why";
/*
late关键字可以用于延迟初始化，即在变量声明时不进行初始化，而是等到变量第一次被使用时再进行初始化。这对于一些需要延迟初始化的场景很有用，比如在构造函数中无法初始化的变量。

使用late关键字声明的变量必须是非空的，并且只能被初始化一次。在使用该变量之前，必须先对其进行初始化，否则会抛出LateInitializationError异常。可以使用lateinit属性来检查变量是否已经被初始化。

 void initialize() {
    name = "John";
  }
  void printName() {
    print(name);
  }
*/
  late int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // this.widget.message
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text(
            "当前计数:$_counter",
            style: const TextStyle(fontSize: 25),
          ),
          Text("传递的信息:${widget.message}")
        ],
      ),
    );
  }

  // child 一个元素
  // children 数组
  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          // onPressed: () => print("Button Clicked!+"),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink, // 设置背景颜色
          ),
          child: const Text("Click Me!+"),
        ),
        TextButton(
          // onPressed: () => print("Button Clicked!-"),
          onPressed: () {
            setState(() {
              // 传入匿名函数
              _counter--;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.purple, // 设置背景颜色
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: const Text(
              'Click Me!-',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DHHomeContent extends StatelessWidget {
  const DHHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        DHHomeProductItem("121", "商品1",
            "https://mmbiz.qpic.cn/mmbiz/k0UVxv3BTLJk8c4Nw4ibNwypiaialyeicuLgclrjtNbqK9gFXyTF1dt9gFxvReiaUu0uF6ibwVZ3Mx1BpKKRvT3bXW1A/640?wx_fmt=other&wxfrom=5&wx_lazy=1&wx_co=1"),
        SizedBox(height: 6),
        DHHomeProductItem("122", "商品2",
            "https://mmbiz.qpic.cn/mmbiz/k0UVxv3BTLJk8c4Nw4ibNwypiaialyeicuLgMibuvlMibP4JZJlcC4gZmbfQ012hGHkNNtSWGCiaWl0830hcwd2pZDvVQ/640?wx_fmt=other&wxfrom=5&wx_lazy=1&wx_co=1"),
        SizedBox(height: 6),
        DHHomeProductItem("123", "商品3",
            "https://mmbiz.qpic.cn/mmbiz/k0UVxv3BTLJk8c4Nw4ibNwypiaialyeicuLg0tLL6DC41SG7pviabcNjSuCcxOfBtw1CHOnj1OVcYn51epTjlXrjUZA/640?wx_fmt=other&wxfrom=5&wx_lazy=1&wx_co=1"),
      ],
    );
  }
}

class DHHomeProductItem extends StatelessWidget {
  // 局部变量
  final String title;
  final String desc;
  final String imageURL;

  const DHHomeProductItem(this.title, this.desc, this.imageURL, {super.key});

  final style1 = const TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = const TextStyle(fontSize: 20, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    //函数内部
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(border: Border.all(width: 5, color: Colors.pink)),
      child: Column(
        //垂直方向
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end, //交叉显示 水平方向:ROW
        //像素溢出
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title, style: style1),
            ],
          ),
          const SizedBox(height: 8),
          Text(desc, style: style2),
          const SizedBox(height: 8),
          Image.network(imageURL)
        ],
      ),
    );
  }
}
