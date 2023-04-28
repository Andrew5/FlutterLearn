import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
// 当使用的数据发生改变时 build方法会被重新执行
// 第一次被插入到widget树中时 当父widget发生改变时 当widge依赖inheritedWidget的一些数据，inheritedWidget数据发生改变时 build方法都会被执行
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 必须重写的方法：build方法
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'First Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const DHHomePage()
        // const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class DHHomePage extends StatelessWidget {
  // 具名构造函数 该构造函数继承了父类StatelessWidget的key属性，并将其传递给父类构造函数。
  // const关键字表示该构造函数是常量构造函数，即在编译时就能确定其值，提高了程序的性能和效率。
  const DHHomePage({super.key});
/*
自定义初始化逻辑：当需要在对象创建时进行特殊的初始化逻辑时，可以增加自定义的构造函数。比如，需要传递额外的参数来初始化对象，或者需要从其他地方获取初始值。
继承父类：当一个类继承了另一个类时，如果想要调用父类的构造函数，可以通过增加构造函数来实现。在子类的构造函数中，可以使用super关键字来调用父类的构造函数。
实现接口：当一个类实现了接口时，如果接口中定义了构造函数，那么类也需要实现相应的构造函数。
创建单例：当需要创建一个单例对象时，可以使用一个私有的构造函数来实现。私有构造函数可以防止在类外部创建对象，而通过类内部的静态方法来获取单例对象。
总之，当需要在对象创建时进行特殊的初始化逻辑时，或者需要继承父类、实现接口、创建单例等特殊需求时，可以增加构造函数。
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 相当于脚手架 VC Activity
        appBar: AppBar(
          title: const Text("第一个Flutter"),
        ),
        body: const DHContentBody());
  }
}

class DHContentBody extends StatefulWidget {
  const DHContentBody({Key? key}) : super(key: key);

  @override
  State<DHContentBody> createState() => _DHContentBodyState();
}

class _DHContentBodyState extends State<DHContentBody> {
  var _flag = true;
  // const DHContentBody({super.key});
  // const 不能修饰包含可变属性的 Widget，需要将 Checkbox 修改为非 const，或者使用 StatefulWidget。?表示该参数可为空
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text(
      //   "Hello World",
      //   style: TextStyle(fontSize: 40, color: Colors.orange),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: _flag,
            // onChanged: (value) {
            //   print(value);
            // },
            // onChanged: (value) => print(value),
            onChanged: (value) {
              setState(() {
                _flag = value!;
              });
            },
          ),
          const Text(
            "同意协议",
            style: TextStyle(fontSize: 20),
          ),
          const Text("Hello")
        ],
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * 有状态的Widget:StatefulWidget 在运行过程中有一些状态(data)需要改变
 * 无状态的Widget:StatelessWidget  内容是确定没有状态(data)的改变
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:1',
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
