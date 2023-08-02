import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Color _backgroundColor = Colors.white; // Màu nền ban đầu là trắng

  void _changeBackgroundColor() {
    // Tạo ngẫu nhiên một màu sắc mới
    Random random = Random();
    Color newColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    setState(() {
      _backgroundColor = newColor; // Thay đổi màu nền
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My homework'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          color: _backgroundColor, // Sử dụng màu nền hiện tại
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeBackgroundColor, // Gọi hàm khi nút được nhấn
                child: Text('Click me to change background colors!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
