import 'package:flutter/material.dart';
import 'package:mobile_project/screens/test_widget.dart';

class TestWidgetScreen extends StatefulWidget {
  const TestWidgetScreen({super.key});

  @override
  State<TestWidgetScreen> createState() => _TestWidgetScreen();
}

class _TestWidgetScreen extends State<TestWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Widget Screen'),
      ),
      body: Column(
        children: [
          const TestWidget(),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Back to Nav',
              style: TextStyle(fontSize: 26),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text(
              '초기화면으로',
              style: TextStyle(fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }
}
