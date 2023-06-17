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
      body: const DHHomeContent(),
    );
  }
}

class DHHomeContent extends StatefulWidget {
  const DHHomeContent({super.key});

  @override
  State<DHHomeContent> createState() => _DHHomeContentState();
}

class _DHHomeContentState extends State<DHHomeContent> {
  @override
  Widget build(BuildContext context) {
    // return const TextDemo();
    return const TextRichDemo();
  }
}

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(
        // text: "He,llo",
        // style: TextStyle(color: Colors.orange, fontSize: 28),
        // 图文混排 富文本
        children: [
          TextSpan(
            text: "http://",
            style: TextStyle(color: Colors.red, fontSize: 28),
          ),
          TextSpan(
            text: "www.baidu.com",
            style: TextStyle(color: Colors.green, fontSize: 28),
          ),
          TextSpan(
            text: "/image",
            style: TextStyle(color: Colors.blue, fontSize: 28),
          ),
          WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
          TextSpan(
            text: "/rich",
            style: TextStyle(color: Colors.blue, fontSize: 28),
          )
        ]));
  }
}

// Text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "戏说乾隆 非凡的公主希瑞 大西洋底来的人 阿凡提的故事 天书奇谭 女娲补天 老狼请客 雪孩子 侠胆雄狮",
      textAlign: TextAlign.center,
      maxLines: 2,
      textScaleFactor: 1.5,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 22,
        color: Colors.amber,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
