import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingControllerA = TextEditingController();
  TextEditingController textEditingControllerB = TextEditingController();
  double result = 0;

  @override
  void dispose() {
    // Clean up the controllers when the Widget is disposed
    textEditingControllerA.dispose();
    textEditingControllerB.dispose();
    super.dispose();
  }

  void add() {
    double numA = double.tryParse(textEditingControllerA.text) ?? 0;
    double numB = double.tryParse(textEditingControllerB.text) ?? 0;
    setState(() {
      result = numA + numB;
    });
  }

  void subtract() {
    double numA = double.tryParse(textEditingControllerA.text) ?? 0;
    double numB = double.tryParse(textEditingControllerB.text) ?? 0;
    setState(() {
      result = numA - numB;
    });
  }

  void multiply() {
    double numA = double.tryParse(textEditingControllerA.text) ?? 0;
    double numB = double.tryParse(textEditingControllerB.text) ?? 0;
    setState(() {
      result = numA * numB;
    });
  }

  void divide() {
    double numA = double.tryParse(textEditingControllerA.text) ?? 0;
    double numB = double.tryParse(textEditingControllerB.text) ?? 0;
    setState(() {
      if (numB != 0) {
        result = numA / numB;
      } else {
        result = double.infinity; // Nếu chia cho 0, hiển thị kết quả là vô cùng
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caculator'),
      ),

      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://i.pinimg.com/564x/81/33/89/81338928da9cca53b984614cacd15868.jpg',
                width: 120,
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              // Two TextFields for input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: textEditingControllerA,
                  decoration: InputDecoration(
                    labelText: 'Nhập số A',
                  ),
                  keyboardType: TextInputType.number, // To show numeric keyboard
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: textEditingControllerB,
                  decoration: InputDecoration(
                    labelText: 'Nhập số B',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                'Kết quả: $result',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Màu nền của nút '+'
                      onPrimary: Colors.white, // Màu chữ của nút '+'
                    ),
                    onPressed: () {
                      add();

                    },
                    child: Text('+'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Màu nền của nút '-'
                      onPrimary: Colors.white, // Màu chữ của nút '-'
                    ),
                    onPressed: () {
                      subtract();

                    },
                    child: Text('-'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Màu nền của nút '*'
                      onPrimary: Colors.white, // Màu chữ của nút '*'
                    ),
                    onPressed: () {
                      multiply();

                    },
                    child: Text('x'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Màu nền của nút '/'
                      onPrimary: Colors.white, // Màu chữ của nút '/'
                    ),
                    onPressed: () {
                      divide();

                    },
                    child: Text(':'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.red,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.yellow,
        height: 100,
        width: 100,
      )
    ],
  );
}
