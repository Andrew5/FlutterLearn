import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // 必须重写的方法：build方法
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
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
        title: const Text("基础widge"),
      ),
      // body: const DHHomeContent(),
    );
  }
}

class DHHomeContent2 extends StatelessWidget {
  const DHHomeContent2({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      // 默认垂直方向排布
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      textBaseline: TextBaseline.alphabetic,
      verticalDirection: VerticalDirection.down,
      mainAxisSize: MainAxisSize.min,
      // textDirection: TextDirection.ltr,
      children: <Widget>[
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
          child: const Text(
            "H",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 120,
          height: 100,
          color: const Color.fromARGB(255, 5, 28, 235),
          child: const Text(
            "W",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 90,
          height: 80,
          color: const Color.fromARGB(255, 107, 88, 87),
          child: const Text(
            "A",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 50,
          height: 120,
          color: const Color.fromARGB(255, 14, 205, 24),
          child: const Text(
            "C",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class DHHomeContent1 extends StatelessWidget {
  const DHHomeContent1({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Row(
        // 默认垂直方向排布
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textBaseline: TextBaseline.alphabetic,
        verticalDirection: VerticalDirection.down,
        mainAxisSize: MainAxisSize.min,
        // textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            width: 80,
            height: 60,
            color: Colors.red,
            child: const Text(
              "H",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 120,
            height: 100,
            color: const Color.fromARGB(255, 5, 28, 235),
            child: const Text(
              "W",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 90,
            height: 80,
            color: const Color.fromARGB(255, 107, 88, 87),
            child: const Text(
              "A",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 50,
            height: 120,
            color: const Color.fromARGB(255, 14, 205, 24),
            child: const Text(
              "C",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
