import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("第一个Flutter程序"),
      ),
      body: const Center(
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 40, color: Colors.orange),
        ),
      ),
    ),
  ));
}
