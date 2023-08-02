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
  TextEditingController _numberController = TextEditingController();
  String _resultMessage = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number == 2) return true;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void _checkPrimeNumber() {
    int number = int.tryParse(_numberController.text) ?? 0;
    setState(() {
      if (isPrime(number)) {
        _resultMessage = '$number là số nguyên tố.';
      } else {
        _resultMessage = '$number không là số nguyên tố.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: 200, // Đặt chiều rộng của TextField
                decoration: BoxDecoration(
                  color: Colors.white, // Màu nền cho TextField
                  borderRadius: BorderRadius.circular(8), // Bo góc
                  border: Border.all(color: Colors.blueAccent), // Viền
                ),
                child: TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center, // Căn giữa nội dung trong TextField
                  decoration: InputDecoration(
                    hintText: 'Nhập số tự nhiên',
                    border: InputBorder.none, // Loại bỏ viền mặc định
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkPrimeNumber,
                child: Text('Kiểm tra'),
              ),
              SizedBox(height: 20),
              Text(_resultMessage),
            ],
          ),
        ),
      ),
    );
  }
}