import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: testWidget(),
      ),
    ),
  );
}

class testWidget extends StatelessWidget {
  const testWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Hello World",
            style: TextStyle(fontSize: 32, color: Colors.lightGreen),
          ),
          Text(
            "Hello Flutter",
            style: TextStyle(fontSize: 32, color: Colors.amber),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              "Hello 1, ",
              style: TextStyle(fontSize: 32, color: Colors.black),
              ),
              Text(
                "Hello 2, ",
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
              Column(
                children: [
                  Text(
                    "Hello 3, ",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  Text(
                    "Hello 4 ",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  Text(
                    "Hello 5 ",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 270,
                height: 270,
                color: Colors.lightGreen,
              ),
              Container(
                transform: Matrix4.rotationZ(0.2),
                width: 210,
                height: 210,
                color: Colors.amberAccent,
              ),
              Container(
                transform: Matrix4.rotationZ(0.4),
                width: 150,
                height: 150,
                color: Colors.white60,
                child: AnalogClock(
                  dialColor: null,
                  markingColor: Colors.brown,
                  hourNumberColor: Colors.brown,
                  secondHandColor: null,
                ),
              ),
              Text(
                "Stack",
                style: TextStyle(fontSize: 24, color: Colors.black87),
              )
            ],
          ),
        ],
      ),
    );
  }
}